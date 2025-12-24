return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = true,
    },
    float = {
      transparent = true, -- enable transparent floating windows
      solid = true, -- use solid styling for floating windows, see |winborder|
    },
    auto_integrations = true,
  },
}
