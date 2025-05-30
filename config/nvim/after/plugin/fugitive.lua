vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gb", ":G blame<CR>", {desc = 'Git blame(fugitive)'})
vim.keymap.set('n', '<leader>gf', function()
  local hash = vim.fn.expand('<cword>')
  vim.cmd('Git commit --fixup=' .. hash)
end, { desc = 'Git fixup commit (under cursor)' })

