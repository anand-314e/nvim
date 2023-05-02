---@type MappingsTable
local M = {}


M.disabled = {
  n = {
      ["<TAB>"] = "",
      ["<S-Tab>"] = "",
      ["<leader>f"] = "",
      ["<C-n>"] = "",
      ["<leader>e"] = "",
      ["<leader>x"] = "",
  },

  v = {
      ["<TAB>"] = "",
      ["<S-Tab>"] = "",
  },
}



M.general = {
  n = {
    ["<C-u>"] = { "<C-u>zz", "Move up with center focus" },
    ["<C-d>"] = { "<C-d>zz", "Move down with center focus" },
    ["QQ"] = { ":q!<enter>", "Close without saving"},
    ["WW"] = { ":wq<enter>", "Close without saving"},
    ["<B>"] = { "$", "beginning of line" },
    ["<E>"] = { "^", "end of line" },
  },

  v = {
    ["<"] = { "<gv", "Stay in visual mode after indenting left" },
    [">"] = { ">gv", "Stay in visual mode after indenting right" },
    ["<B>"] = { "$", "beginning of line" },
    ["<E>"] = { "^", "end of line" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },


    -- close buffer + hide terminal buffer
    ["<leader>q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}


-- more keybinds!
M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fa"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.trouble = {
  plugin = true,

  n = {
      ["<leader>xx"] = { "<Cmd>TroubleClose<CR>", "Close diagnostic window" },
      ["<leader>xd"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Toggle diagnostic window for the document" },
      ["<leader>xw"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle diagnostic window for the workspace" },
      ["<leader>xr"] = { "<Cmd>TroubleToggle lsp_references<CR>", "Toggle LSP reference" },
      ["<leader>xq"] = { "<Cmd>TroubleToggle quickfix<CR>","Toggle quickfix" },
      ["<leader>xl"] = { "<Cmd>TroubleToggle loclist<CR>","Toggle location list" },
  }
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>e"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },
  }
}



M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.copilot = {

}

return M
