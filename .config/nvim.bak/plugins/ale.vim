" ale
let g:ale_linters = {
            \ 'go': ['go lint', 'go vet']
}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
      \ 'ruby': ['rubocop --auto-correct'],
      \ 'eruby': ['erblint'],
}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

