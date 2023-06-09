local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     -- format & linting
  --     {
  --       "jose-elias-alvarez/null-ls.nvim",
  --       config = function()
  --         require "custom.configs.null-ls"
  --       end,
  --     },
  --   },
  --   config = function()
  --     require "plugins.configs.lspconfig"
  --     require "custom.configs.lspconfig"
  --   end, -- Override to setup mason-lspconfig
  -- },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    'simrat39/rust-tools.nvim',
    event = "BufRead",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "mfussenegger/nvim-dap"
      },
      {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        dependencies = {
          "nvim-lua/plenary.nvim",
          {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
              require "custom.configs.null-ls"
            end,
          },
       },
        config = function()
          require("crates").setup({
            null_ls = {
              enabled = true,
              name = "crates.nvim",
            },
            popup = {
              border = "rounded",
            },
          })
        end,
      },
    },

    config = function()
      require "custom.configs.rust-tools"
    end, -- Override to setup mason-lspconfig
  },
  {
  -- LSP DIAGNOSTICS
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup()

    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-g>",
            accept_word = false,
            accept_line = false,
            next = "<C->>",
            prev = "<C-<>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "jonahgoldwastaken/copilot-status.nvim",
    dependencies = { "zbirenbaum/copilot.lua", }, -- or 
    lazy = true,
    event = "BufReadPost",

  },

  {
    "ErichDonGubler/lsp_lines.nvim",
    event = "VimEnter",
    config = function()
      require("lsp_lines").setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*" }, --ini untuk file yang tidak ingin dibaca
        callback = function()
          local exclude_ft = {
            "lazy",
          }
          if vim.tbl_contains(exclude_ft, vim.o.filetype) then
            vim.diagnostic.config({ virtual_lines = false })
          else
            vim.diagnostic.config({ virtual_lines = true })
          end
        end,
      })
    end,
  },
  {
   "tpope/vim-dadbod",
    -- opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()

      vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
        },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      })

    end,
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  },

}

return plugins

