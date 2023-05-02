---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvchad",
  theme_toggle = { "gruvchad", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    icons = true,
    lspkind_text = false,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
  },

  statusline = {
    theme = "minimal",
    separator_style = "block",
    overriden_modules = function()
      return {
        copilot = function()
          return require('copilot_status').status_string
        end,
      }
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
