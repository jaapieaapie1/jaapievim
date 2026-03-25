return {
  -- Use intelephense instead of phpactor for better anonymous class support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = { enabled = false },
        intelephense = {
          enabled = true,
        },
      },
    },
  },

  -- Use Pint for PHP formatting (instead of php-cs-fixer)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { "pint" }
    end,
  },

  -- Downgrade phpcs diagnostics from errors/warnings to hints
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        phpcs = {
          parser = function(output, _)
            if vim.trim(output) == "" or output == nil then
              return {}
            end
            local diagnostics = {}
            local decoded = vim.json.decode(output)
            for _, result in pairs(decoded.files) do
              for _, msg in ipairs(result.messages or {}) do
                table.insert(diagnostics, {
                  lnum = msg.line - 1,
                  end_lnum = msg.line - 1,
                  col = msg.column - 1,
                  end_col = msg.column - 1,
                  message = msg.message,
                  code = msg.source,
                  source = "phpcs",
                  severity = vim.diagnostic.severity.HINT,
                })
              end
            end
            return diagnostics
          end,
        },
      },
    },
  },
  {
    "tamton-aquib/duck.nvim",
    config = function()
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch("🐥")
      end, {})
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, {})
      vim.keymap.set("n", "<leader>da", function()
        require("duck").cook_all()
      end, {})
    end,
  },
}
