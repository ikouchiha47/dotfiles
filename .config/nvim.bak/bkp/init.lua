-- init.lua

-- wo = vim.wo    -- window local
-- bo = vim.bo    -- buffer local
-- fn = vim.fn    -- access vim functions

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

require('dependencies')
require('plugins')

vim.cmd("source ~/.config/nvim/basic.vim")
vim.cmd("source ~/.config/nvim/start.vim")
vim.cmd("source ~/.config/nvim/commentator.vim")

require('keybindings')
