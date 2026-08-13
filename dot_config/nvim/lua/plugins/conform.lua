return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,
    formatters_by_ft = {
      kdl = { "kdlfmt" },
      http = { "kulala-fmt" },
    },
    formatters = {
      ["kulala-fmt"] = {
        env = {
          KULALA_CORE_PATH = vim.fn.stdpath("data") .. "/kulala.nvim/bin/kulala-core",
        },
      },
    },
  },
}
