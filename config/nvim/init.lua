require("config")


-- Function to open the journal entry based on today's date
local function open_todays_file()
  local date = os.date("%Y-%m-%d")
  local dir = vim.fn.expand("~/Documents/notes/journal/")
  local filepath = dir .. date .. ".md"

  -- Check if the directory exists and create it if it doesn't
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  vim.cmd("edit " .. filepath)
end

local function send_notes_to_cloud()
  local dir = "~/Documents/notes/"
  vim.cmd("!rclone copy " .. dir .. " notes:notes ")
end

local function copy_file_path()
  local file = vim.fn.expand("%:p") -- Full file path
  local line = vim.fn.line(".") -- Current line number
  local col = vim.fn.col(".") -- Current column number
  local result = file .. ":" .. line .. "," .. col 
  -- Follows format so that gF takes me there

  -- Copy to system clipboard
  vim.fn.setreg("+", result)

  print("Copied: " .. result)
end

vim.api.nvim_create_user_command('DailyNotes', open_todays_file, {})
vim.api.nvim_create_user_command('SendNotes', send_notes_to_cloud, {})
vim.api.nvim_create_user_command("CopyFilePath", copy_file_path, {})
