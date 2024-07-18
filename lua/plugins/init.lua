return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "pyright",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = function()
            local conf = require "nvchad.configs.telescope"

            conf.defaults.mappings.i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ["<Esc>"] = require("telescope.actions").close,
            }

            -- or
            -- table.insert(conf.defaults.mappings.i, your table)

            return conf
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        lazy = false,   -- This plugin is already lazy
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, bufnr)
                        -- Hide semantic highlights for functions
                        vim.api.nvim_set_hl(0, "@lsp.type.function", {})
                        -- Hide all semantic highlights
                        for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                            vim.api.nvim_set_hl(0, group, {})
                        end
                    end,
                },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "rust",
                "python",
            },
        },
    },
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup {
                columns = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<M-h>"] = "actions.select_split",
                },
                view_options = {
                    show_hidden = true,
                },
            }

            vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
            vim.keymap.set(
                "n",
                "<space>-",
                require("oil").toggle_float,
                { desc = "Open parent directory in floating window" }
            )
        end,
    },
    {
        'saecki/crates.nvim',
        ft = { "rust", "toml" },
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "nvchad.configs.cmp"
            table.insert(M.sources, { name = "crates" })
            return M
        end,
    },
}
