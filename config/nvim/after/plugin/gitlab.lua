require("gitlab").setup()

vim.api.nvim_create_user_command('Gitlab', function()
  require("gitlab").summary()
end, { desc = "Open GitLab MR Summary" })

vim.api.nvim_create_user_command('GitlabReview', function()
  require("gitlab").review()
end, { desc = "Open GitLab MR Review" })

vim.api.nvim_create_user_command('GitlabOpenBrowser', function()
  require("gitlab").open_in_browser()
end, { desc = "Open MR in Browser" })

vim.api.nvim_create_user_command('GitlabDiscussions', function()
  require("gitlab").toggle_discussions()
end, { desc = "Toggle Discussions" })

-- This scares me because I don't understand it.
function add_comments_to_quickfix()
  local gitlab = require("gitlab")
  gitlab.data({ { type = "discussions", refresh = true } }, function(data)
    local qflist = {}
    for _, discussion in ipairs(data.discussions) do
      for _, note in ipairs(discussion.notes) do
        table.insert(qflist, {
          filename = note.position.new_path,
          lnum = note.position.new_line,
          text = note.body,
          type = "I", -- 'I' for Info, you can adjust this
        })
      end
    end
    vim.fn.setqflist(qflist)
  end)
end

vim.api.nvim_create_user_command('GitlabQuickfix', function()
  add_comments_to_quickfix()
end, { desc = "Add Comments to Quickfix" })
