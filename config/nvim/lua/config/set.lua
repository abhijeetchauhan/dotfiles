vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = "90"

vim.g.mapleader = " "

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true

vim.opt.autowriteall = true
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us"

-- mark sure numbers show up
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set number relativenumber",
})

vim.opt.foldlevelstart = 99
