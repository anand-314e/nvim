local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "rust",
    "toml",
    "c",
    "json",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "rust-analyzer",
    "pyright"
  },
}

-- git support in nvimtree
-- M.nvimtree = {
--   view ={
--     side = "right",
--   },
--   git = {
--     enable = true,
--   },
--
--   renderer = {
--     highlight_git = false,
--     icons = {
--       show = {
--         git = true,
--       },
--       glyphs = {
--         git = {
--           unstaged = "",
--           staged = "✓",
--           unmerged = "",
--           renamed = "➜",
--           untracked = "*",
--           deleted = "✗",
--           ignored = "◌",
--         },
--       },
--     },
--   },
-- }

return M
