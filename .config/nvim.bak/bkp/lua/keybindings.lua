-- Mappings

---- splits
--
nmap('<leader>h', ':<C-u>split<CR>')
nmap('<leader>v', ':<C-u>vsplit<CR>')

---- git
nmap('<Leader>ga', ':Gwrite<CR>')
nmap('<Leader>gc', ':Git commit --verbose<CR>')
nmap('<Leader>gsh',':Gpush<CR>')
nmap('<Leader>gll',':Gpull<CR>')
nmap('<Leader>gs', ':Gstatus<CR>')
nmap('<Leader>gb', ':Gblame<CR>')
nmap('<Leader>gd', ':Gvdiff<CR>')
nmap('<Leader>gr', ':Gremove<CR>')
nmap('<Leader>o', ':.Gbrowse<CR>')

---- session management
nmap('<leader>so', ':OpenSession<Space>')
nmap('<leader>ss', ':SaveSession<Space>')
nmap('<leader>sd', ':DeleteSession<CR>')
nmap('<leader>sc', ':CloseSession<CR>')

---- Tabs
nmap('<Tab>', 'gt')
nmap('<S-Tab>', 'gT')
nmap('<silent> <S-t>', ':tabnew<CR>')
nmap('<leader><leader>', 'gt')

---- Set working directory
nmap('<leader>.', ':lcd %:p:h<CR>')


nmap('<Leader>te', ':tabe <C-R>=expand("%:p:h") . "/" <CR>')

---- history and paste
nmap('<leader>y', ':History:<CR>')
nmap('YY', '"+y<CR>')
nmap('<leader>p', '"+gP<CR>')
nmap('XX', '"+x<CR>')

if vim.fn.has("macunix") then
    map('v', '<C-x>', ':!pbcopy<CR>')
    map('v', '<C-c> :w', '!pbcopy<CR><CR>')
end

---- buffers and grep
vim.cmd("nnoremap <silent> <leader>b :Buffers<CR>")
vim.cmd("nnoremap <silent> <leader>e :FZF -m<CR>")

nmap('<leader>z', ':bp<CR>')
nmap('<leader>q', ':bp<CR>')
nmap('<leader>x', ':bn<CR>')
nmap('<leader>w', ':bn<CR>')
nmap('<leader>c', ':bd<CR>')

---- switching windows
--
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')
nmap('<C-h>', '<C-w>h')

map('v', '<', '<gv')
map('v', '>', '>gv')
vim.cmd("vnoremap J :m '>+1<CR>gv=gv")
vim.cmd("vnoremap K :m '<-2<CR>gv=gv")



