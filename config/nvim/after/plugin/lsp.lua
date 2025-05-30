-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

---
-- LSP configuration
---
local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  -- 🔥 Keep function signature help visible while typing
  require("lsp_signature").on_attach({
    bind = true,
    floating_window = true,  -- Show signature in a floating window
    always_trigger = true,   -- Keep it open while typing
    handler_opts = { border = "rounded" },
  }, bufnr)
end

vim.keymap.set("i", "<C-k>", function()
  require("lsp_signature").toggle_float_win()
end, { noremap = true, silent = true })


lsp_zero.extend_lspconfig({
  sign_text = false,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

---
-- Autocompletion setup
---
local cmp = require('cmp')

-- apparantly used by friendly_snippets
require('luasnip.loaders.from_vscode').lazy_load()
cmp.register_source('look', require('cmp_look').new())

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
    {name = 'emoji'},
    {name = 'look'},
    {name = 'luasnip'},
    {name = 'path'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Simple tab complete
    ['<Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item({behavior = 'select'})
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    -- Go to previous item
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')

      if cmp.visible() then
        cmp.select_prev_item({behavior = 'select'})
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
  }),
})


---
-- LSP Server Config
---

require'lspconfig'.pyright.setup{}
require('lspconfig').ts_ls.setup {
    root_dir = require('lspconfig.util').root_pattern('package.json', 'tsconfig.json'),
}
-- require'lspconfig'.ltex.setup{}

---
-- Lua snippets
--

local luasnip = require('luasnip')

luasnip.add_snippets("python", {
    luasnip.snippet("ti", {
        luasnip.text_node("  # text: ignore")
    }),
})
