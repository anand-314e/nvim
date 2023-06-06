---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
local modes = {
  ["n"] = { "N", "St_NormalMode" },
  ["niI"] = { "N-i", "St_NormalMode" },
  ["niR"] = { "N-r", "St_NormalMode" },
  ["niV"] = { "N-v", "St_NormalMode" },
  ["no"] = { "N-P", "St_NormalMode" },
  ["i"] = { "I", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },
  ["t"] = { "TER", "St_TerminalMode" },
  ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
  ["v"] = { "V", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE (Ctrl O)", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },
  ["R"] = { "R", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "CMD", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}
M.ui = {
  theme = "doomchad",
  theme_toggle = { "doomchad", "one_light" },

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
      local m = vim.api.nvim_get_mode().mode
      local current_mode = "%#" .. modes[m][2] .. "#" .. "█ " .. modes[m][1]
      local mode_sep1 = "%#" .. modes[m][2] .. "Sep" .. "#" .. "█"


      return {
        mode = function()
          return current_mode .. mode_sep1 .. "%#ST_EmptySpace#" .. "█"
        end,
      }
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
