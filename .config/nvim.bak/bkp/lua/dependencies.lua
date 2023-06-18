local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/./plugged')

Plug('tpope/vim-vinegar')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-rhubarb')
Plug('tpope/vim-surround')

Plug('vim-airline/vim-airline')
Plug('airblade/vim-gitgutter')
Plug('vim-scripts/CSApprox')
Plug('Raimondi/delimitMate')
Plug('majutsushi/tagbar')
Plug('dense-analysis/ale')
Plug('Yggdroot/indentLine')
Plug('wesQ3/wombat.vim')
Plug('ctrlpvim/ctrlp.vim')
Plug('machakann/vim-highlightedyank')
Plug('frazrepo/vim-rainbow')
Plug('kamykn/spelunker.vim')
Plug('junegunn/goyo.vim')
Plug('preservim/nerdtree', {on = 'NERDTreeToggle'})
Plug('neoclide/coc.nvim', {['do'] = 'yarn install --frozen-lockfile'})

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('ThePrimeagen/git-worktree.nvim')

Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do']= './install --bin' })
Plug('junegunn/fzf.vim')

-- Vim-Session
Plug('xolox/vim-misc')
Plug('xolox/vim-session')

-- Snippets
Plug('SirVer/ultisnips')
Plug('honza/vim-snippets')

-- Themes
Plug('vim-airline/vim-airline-themes')
Plug('tomasr/molokai')
Plug('morhetz/gruvbox')
Plug('ayu-theme/ayu-vim')
Plug('arcticicestudio/nord-vim')

-- Vim go
Plug('fatih/vim-go', { ['do'] = ':GoInstallBinaries'})

vim.call('plug#end')

