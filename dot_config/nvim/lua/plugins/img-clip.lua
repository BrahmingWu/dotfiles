return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    default = {
      relative_to_current_file = true, ---@type boolean | fun(): boolean
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
