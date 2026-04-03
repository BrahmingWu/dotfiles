-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local modes = { "n", "i", "v", "s" }
for _, mode in ipairs(modes) do
  pcall(vim.keymap.del, mode, "<C-s>")
end
local map = LazyVim.safe_keymap_set
-- vim.keymap.set("n", "<C-D-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- vim.keymap.set("n", "<C-D-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
-- vim.keymap.set("n", "<C-D-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- vim.keymap.set("n", "<C-D-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })



map("n", "<C-D-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-D-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-D-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-D-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
Snacks.toggle.zoom():map("<C-D-CR>"):map("<C-w>m")
