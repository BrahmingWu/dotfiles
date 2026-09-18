return {
  {
    "mason-org/mason.nvim",
    -- LazyVim's core spec already sets opts_extend = { "ensure_installed" },
    -- so this list is appended to (not replacing) LazyVim's and the extras' lists.
    -- Only packages that no LazyVim extra installs belong here.
    opts = {
      ensure_installed = {
        "kdlfmt", -- conform.nvim: kdl
        "kulala-fmt", -- conform.nvim: http
        "mmdc", -- mermaid-cli (browser must be installed separately)
      },
    },
  },
}
