" vim-bootstrap 

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,elixir,erlang,go,javascript,lua,ocaml,ruby"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

let g:python3_host_prog = '/usr/bin/python3.8'
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'wsdjeg/FlyGrep.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

Plug 'dag/vim-fish', {'for': ['fish']}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'owickstrom/vim-colors-paramount'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

"" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
"Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" elixir
"Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack', 'for': ['elixir']}
"Plug 'elixir-lang/vim-elixir'
"Plug 'carlosgaldino/elixir-snippets'


" elm
"" Elm Bundle
" Plug 'elmcast/elm-vim'


" erlang
"Plug 'jimenezrick/vimerl'


" go
"" Go Lang Bundle
"Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': ['go']}


" javascript
"" Javascript Bundle
"Plug 'jelera/vim-javascript-syntax'


" lua
"" Lua Bundle
"Plug 'xolox/vim-lua-ftplugin'
"Plug 'xolox/vim-lua-inspect'


" ocaml
"" OCaml Bundle
"Plug 'def-lkb/ocp-indent-vim'


" ruby
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-rake'
"Plug 'tpope/vim-projectionist'
"Plug 'thoughtbot/vim-rspec'
"Plug 'ecomba/vim-ruby-refactoring'


"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" map to escape
:imap zz <Esc>
:imap `` <Esc>

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10


"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" autocmd VimEnter * NERDTree 
autocmd VimEnter * wincmd p
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
"augroup vimrc-sync-fromstart
"  autocmd!
"  autocmd BufEnter * :syntax sync maxlines=200
"augroup END

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=100 maxlines=100
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"reload
noremap <Leader>r :source $MYVIMRC<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" CocSnippets
let g:coc_snippet_next = '<c-Tab>'

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" distraction free
let g:goyo_width = 150
let g:goyo_height = "75%"
nnoremap <leader>g :Goyo<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" elixir


" elm
" elm-vim
" let g:elm_setup_keybindings = 0
" let g:elm_format_autosave = 1

" vim-polyglot
" let g:polyglot_disabled = ['elm']


" erlang
"let erlang_folding = 1
"let erlang_show_errors = 1

" python
"autocmd BufEnter *.py
" autocmd FileType python colorscheme palenight
autocmd FileType python setlocal background=dark termguicolors

" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

"let g:go_list_type = "quickfix"
"let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
"
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_space_tab_error = 0
"let g:go_highlight_array_whitespace_error = 0
"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
	au FileType go nmap ga :GoImplements<cr>

augroup END

" ale
:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" lua


" ocaml
" Add Merlin to rtp
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute \"set rtp+=\" . g:opamshare . \"/merlin/vim"

" ale
:call extend(g:ale_linters, {
    \'ocaml': ['merlin'], })


" ruby
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" RSpec.vim mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" For ruby refactory
if has('nvim')
  runtime! macros/matchit.vim
else
  packadd! matchit
endif

" Ruby refactory
"nnoremap <leader>rap  :RAddParameter<cr>
"nnoremap <leader>rcpc :RConvertPostConditional<cr>
"nnoremap <leader>rel  :RExtractLet<cr>
"vnoremap <leader>rec  :RExtractConstant<cr>
"vnoremap <leader>relv :RExtractLocalVariable<cr>
"nnoremap <leader>rit  :RInlineTemp<cr>
"vnoremap <leader>rrlv :RRenameLocalVariable<cr>
"vnoremap <leader>rriv :RRenameInstanceVariable<cr>
"vnoremap <leader>rem  :RExtractMethod<cr>

"set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

set guicursor=i:ver25-iCursor

autocmd VimLeave * set guicursor=a:ver25-iCursor

set termguicolors
set t_Co=256
set background=light
" colorscheme solarized8

"let ayucolor="light"
"colorscheme ayu
colorscheme onedark

set mouse=a
set foldmethod=indent
set foldlevel=5
set nofoldenable

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
              \'cpp':    { 'exec': '!mkdir -p out/ && g++ -std=c++20 ', 'extra': '-o out/'.filename, 'after': './out/'.filename },
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

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
vnoremap <S-Up> :m '<-2<CR>
vnoremap <S-Up> :m '>+1<CR>

inoremap <S-tab> <C-x><C-o>
nnoremap <leader><CR> :call InlineExec()<CR>
nmap <leader>n :NERDTreeFind<CR>

silent! autocmd FocusLost * :wa
silent! autocmd BufLeave * :wa

"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }
