return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
                                                     
   ▄▄▄▄▄▄                         ▄▄▄                
  █▀ ██                          █▀██  ██▀▀          
     ██                   ▀▀       ██  ██ ▀▀ ▄       
     ██ ▄▀▀█▄ ▄▀▀█▄ ████▄ ██ ▄█▀█▄ ██  ██ ██ ███▄███▄
     ██ ▄█▀██ ▄█▀██ ██ ██ ██ ██▄█▀ ██▄ ██ ██ ██ ██ ██
     ██▄▀█▄██▄▀█▄██▄████▀▄██▄▀█▄▄▄  ▀███▀▄██▄██ ██ ▀█
 ▄   ██             ██                               
 ▀████▀             ▀                                
]],
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            {
              icon = " ",
              key = "p",
              desc = "Projects",
              action = function()
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
              end,
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
