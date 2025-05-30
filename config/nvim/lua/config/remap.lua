vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz")
vim.keymap.set('n', '<leader>je', '<cmd>DailyNotes<CR>')
vim.keymap.set('n', '<leader>sn', '<cmd>SendNotes<CR><CR>')
vim.keymap.set('n', '<leader>cfp', '<cmd>CopyFilePath<CR>')
vim.keymap.set('n', '<leader><CR>', '<cmd>:w<CR>')
 
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "m", function()
  local char = vim.fn.getcharstr()
  vim.cmd("mark " .. char:upper())
end, { noremap = true, silent = true })

vim.keymap.set("n", "'", function()
  local char = vim.fn.getcharstr()
  vim.cmd("normal! '" .. char:upper())
end, { noremap = true, silent = true })
