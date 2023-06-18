local o  = vim.opt -- global
local g  = vim.g     -- global for let options
local cmd = vim.cmd 

-- vim-airline
g.airline_theme = 'powerlineish'
cmd("let g:airline#extensions#branch#enabled = 1")
cmd("let g:airline#extensions#ale#enabled = 1")
cmd("let g:airline#extensions#tabline#enabled = 1")
cmd("let g:airline#extensions#tagbar#enabled = 1")
cmd("let g:airline_skip_empty_sections = 1")

-- vim-rainbow
g.rainbow_active = 1

cmd("autocmd VimEnter * wincmd p")
