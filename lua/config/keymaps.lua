-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>p", function()
  local projects_dir = vim.fn.expand("~/Work")
  local dirs = {}
  for name, type in vim.fs.dir(projects_dir) do
    if type == "directory" then
      table.insert(dirs, name)
    end
  end
  table.sort(dirs)
  vim.ui.select(dirs, { prompt = "Select project:" }, function(choice)
    if choice then
      local path = projects_dir .. "/" .. choice
      vim.cmd.cd(path)
      Snacks.explorer.open({ cwd = path })
    end
  end)
end, { desc = "Open Project" })
