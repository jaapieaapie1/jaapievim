return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          semanticHighlighting = {
            strings = { enable = false },
          },
        },
      },
    },
  },
}
