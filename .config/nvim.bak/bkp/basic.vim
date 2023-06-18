filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set updatetime=200
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" spell check
set nospell
let g:enable_spelunker_vim = 1
let g:spelunker_target_min_char_len = 4
let g:spelunker_check_type = 2

"" Fix backspace indent
set backspace=indent,eol,start
set nobackup nowritebackup

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
let g:session_directory = "~/./session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set relativenumber
set number
set noswapfile

let no_buffers_menu=1
set termguicolors 
colorscheme ayu
set background=dark

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monaco\ 10
 
set mouse=a
set foldmethod=indent
set foldlevel=5
set nofoldenable

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

   " IndentLine
   let g:indentLine_enabled = 1
   let g:indentLine_concealcursor = 0
   let g:indentLine_char = '┆'
   let g:indentLine_faster = 1
 
   
   if $COLORTERM == 'gnome-terminal'
     set term=gnome-256color
   else
     if $TERM == 'xterm'
       set term=xterm-256color
     endif
   endif
   
 endif


if &term =~ '256color'
  set t_ut=
endif


"" Disable the blinking cursor.
set gcr=a:blinkon0

set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10
" 
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

" vim-rainbow
let g:rainbow_active = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

