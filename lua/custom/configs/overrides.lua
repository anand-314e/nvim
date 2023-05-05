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

M.nvimtree = {
  hijack_unnamed_buffer_when_opening = false,
  view ={
    side = "right",
  },
  git = {
    enable = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = false,
  },
  renderer = {
    highlight_git = false,
    root_folder_label = function(path)
      local project = vim.fn.fnamemodify(path, ":t")
      return string.upper(project)
    end,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "*",
          deleted = "✗",
          ignored = "◌",
        },
      },
    },
  },
}

return M
