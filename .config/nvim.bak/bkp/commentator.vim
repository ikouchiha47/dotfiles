function! s:isEmptyLine(line)
  return a:line =~ '^\s*$'
endfunction

function! s:trimSpaces(l, r)
  return [trim(a:l), trim(a:r)]
endfunction

function! s:isCommented(line, left_literal, right_literal)
  let [l, r] = s:trimSpaces(a:left_literal, a:right_literal)

  return len(a:line) && (stridx(a:line,l) >= 0 && a:line[strlen(a:line)-strlen(r) : -1] ==# r)
endfunction

function! s:commentLine(line, left_literal, right_literal)
  let [l, r] = [a:left_literal, a:right_literal]
  " matches anything (.*) 0 or more times to the end of line $
  " which is preceeded (\zs)
  " by spaces from start of string ^(\s*)
  return substitute(a:line, '^\(\s*\)\zs.*$', '\=l.submatch(0).r' ,'')
endfunction

function! s:unCommentLine(line, left_literal, right_literal)
  " works with old code with no space between comments
  let [l, r] = s:trimSpaces(a:left_literal, a:right_literal)
  " uncommeneted line
  let uncomment = 1

  if a:line[0: 1] == l + " "
      let l = l . " "
  endif

  if strlen(r) > 0
      let uncomment = uncomment - 1
  endif


  " take everything between opening and closing literal and replace with
  " actual data      
  let line = substitute(a:line, '\S.*\s', '\=submatch(0)[strlen(l):-strlen(r)-uncomment]', '')             
  if strlen(r)
      let line = line[:-strlen(r)-1]
  endif

  return line
  " let line = substitute(line, '\S.*\s', '\=submatch(0)[:-1]', '')  
endfunction

" uses commentstring of vim
" sometimes me get multiple comments from commentstring
" even if its single line
function! s:getCommentLiterals()
  let comment_formats = { 'python': '# %s', 'vim': '" %s' }
  let literal = get(b:, 'comment_format', &commentstring)

  if s:isEmptyLine(literal)
    let literal = get(comment_formats, &filetype, ' %s')
  endif

  " adds single spaces to either side for beauty
  let literal = substitute(literal, '\S\zs%s', ' %s ' ,'')
  return split(literal, '%s', 1)
endfunction

function! Commentator() abort
  try
    let success = 1
    let text = getline('.')
    let comment_literals = s:getCommentLiterals()

    if s:isEmptyLine(text)
      return
    endif

    if s:isCommented(text, comment_literals[0], comment_literals[1])
      let text = s:unCommentLine(text, comment_literals[0], comment_literals[1])
    else
      let text = s:commentLine(text, comment_literals[0], comment_literals[1])
    endif
  finally
    if !exists('success')
      echo "error"
    else
      call setline('.', text)
    endif
  endtry
endfunction

function! InlineExec()
  let shell = $SHELL
  let shell_executor = split(shell, '/')[-1]

  let filename = fnamemodify(bufname("%"), ":r")
  let executors = {
              \'python': { 'exec': '!python' },
              \'vim':    { 'exec': 'source' },
              \'sh':     { 'exec': '!'.shell_executor },
              \'go':     { 'exec': '!go run' },
              \'ruby':   { 'exec': '!ruby' },
              \'rust':   { 'exec': '!rustc', 'after':  './'.filename },
              \'cpp':    { 'exec': '!mkdir -p out/ && g++ -std=c++17 ', 'extra': '-o out/'.filename, 'after': './out/'.filename },
              \'javascript': { 'exec': '!node' }
              \}

  let executor = get(executors, &filetype, {})

  silent !clear  

  if executor["exec"] ==# ''
    echo "no executable"
    return
  endif

  let stmt = ': ' . executor["exec"] . ' '. bufname("%")
  if has_key(executor, "extra")
      let stmt = stmt .' '. executor["extra"]
  endif

  execute stmt
  if has_key(executor, "after")
      execute ':!' . executor["after"]
  endif
endfunction

nnoremap <leader>/ :call Commentator()<CR>
vnoremap <leader>/ :call Commentator()<CR>
inoremap <C-_> <C-O>:call Commentator()<CR>

