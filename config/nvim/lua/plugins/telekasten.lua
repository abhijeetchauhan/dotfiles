return {
    'nvim-telekasten/telekasten.nvim',
    config = function()
        require("telekasten").setup({
            -- Configuration here, or leave empty to use defaults
            home = vim.fn.expand("~/Documents/notes/zettelkasten/"),
            template_new_note = vim.fn.expand('~/Documents/notes/templates/note.md'),
            template_new_daily = vim.fn.expand('~/Documents/notes/templates/daily.md')
        })
    end
}
