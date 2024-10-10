-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  changed_themes = {
    catppuccin = {
      base_16 = {
        base00 = "#1E1D2D",
        base01 = "#282737",
        base02 = "#2f2e3e",
        base03 = "#383747",
        base04 = "#414050",
        base05 = "#bfc6d4",
        base06 = "#ccd3e1",
        base07 = "#D9E0EE",
        base08 = "#F38BA8",
        base09 = "#F8BD96",
        base0A = "#FAE3B0",
        base0B = "#ABE9B3",
        base0C = "#89DCEB",
        base0D = "#89B4FA",
        base0E = "#CBA6F7",
        base0F = "#F38BA8",
      },
      base_30 = {
        white = "#D9E0EE",
        darker_black = "#191828",
        black = "#1E1D2D", --  nvim bg
        black2 = "#252434",
        one_bg = "#2d2c3c", -- real bg of onedark
        one_bg2 = "#363545",
        one_bg3 = "#3e3d4d",
        grey = "#474656",
        grey_fg = "#4e4d5d",
        grey_fg2 = "#555464",
        light_grey = "#605f6f",
        red = "#F38BA8",
        baby_pink = "#ffa5c3",
        pink = "#F5C2E7",
        line = "#383747", -- for lines like vertsplit
        green = "#ABE9B3",
        vibrant_green = "#b6f4be",
        nord_blue = "#8bc2f0",
        blue = "#89B4FA",
        yellow = "#FAE3B0",
        sun = "#ffe9b6",
        purple = "#d0a9e5",
        dark_purple = "#c7a0dc",
        teal = "#B5E8E0",
        orange = "#F8BD96",
        cyan = "#89DCEB",
        statusline_bg = "#232232",
        lightbg = "#2f2e3e",
        pmenu_bg = "#ABE9B3",
        folder_bg = "#89B4FA",
        lavender = "#c7d1ff",
      },
    },
  },
}

M.ui = {
  theme = "catppuccin",
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  transparency = false,
  statusline = {
    -- more opts

    -- Separator style and theme
    theme = "vscode_colored", -- default, vscode, vscode_colored or minimal
    separator_style = "default",
  },
}

M.lsp = { signature = false }
M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "pyright",
    "bash-language-server",
    "codelldb",
  },
}

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

return M
