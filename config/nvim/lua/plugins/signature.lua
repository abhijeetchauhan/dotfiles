return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  config = function()
    require("lsp_signature").setup({
      bind = true,
      floating_window = true,        -- Use a floating window
      hint_enable = false,           -- Disable inline hints (optional)
      always_trigger = true,         -- Keep it open while typing
      handler_opts = { border = "rounded" },
    })
  end,
}
