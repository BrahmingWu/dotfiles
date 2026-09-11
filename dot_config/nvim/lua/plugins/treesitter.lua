return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      -- Register custom parser for kulala_http so that :TSUpdate / Lazy updates do not error out
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          -- Automatically track the parser revision required by kulala.nvim
          local ok, globals = pcall(require, "kulala.globals")
          local revision = ok and globals.TREESITTER_VERSION or "630e2b8523c775ba866564c2b4ad88d649a56c00"

          require("nvim-treesitter.parsers").kulala_http = {
            install_info = {
              url = "https://github.com/mistweaverco/tree-sitter-kulala-http",
              revision = revision,
              queries = "queries/kulala_http",
            },
          }
        end,
      })
    end,
  },
}
