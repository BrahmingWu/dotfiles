return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
  },
  opts = {
    image = {
      enabled = true,
      doc = { max_width = 100, max_height = 100 },
    },
    dashboard = {
      preset = {
        header = [[NVIM]],
      },
    },
    bigfile = {
      notify = true, -- show notification when big file detected
      size = 1.5 * 1024 * 1024, -- 1.5MB
      line_length = 1500000, -- average line length (useful for minified files)
    },
    indent = {
      chunk = {
        -- when enabled, scopes will be rendered as chunks, except for the
        -- top-level scope which will be rendered as a scope.
        enabled = true,
        -- only show chunk scopes in the current window
        only_current = false,
        priority = 200,
        hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "─",
          vertical = "│",
          arrow = "─",
        },
      },
    },
  },
}
