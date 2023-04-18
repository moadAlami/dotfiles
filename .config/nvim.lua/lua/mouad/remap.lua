vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<space>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<space>k", "<cmd>lprev<CR>zz")

vim.keymap.set('x', '<c-c>', '"+y')
vim.keymap.set('n', 'cp', '"+p')

vim.keymap.set('n', 'S', '<CR><Esc>')

vim.keymap.set('n', '<F6>', ':setlocal spell! spelllang=fr<CR>')
vim.keymap.set('n', '<F8>', ':setlocal spell! spelllang=en_gb<CR>')

vim.keymap.set('i',  '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
