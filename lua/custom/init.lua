local autocmd = vim.api.nvim_create_autocmd

-- Open nvim-tree on opening directory
autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open({
      path = vim.fn.getcwd(-1, -1),
      current_window = true,
      find_file = false,
      update_root = true,
      focus = true,
    })
  end
})

autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = 150})
  end
})

-- Enable spellchecking in markdown, text and gitcommit files
autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Lazy load rust-tools
autocmd("FileType", {
  pattern = {"rust"},
  callback = function ()
    require "custom.configs.rust-tools"
  end
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- -- Lazy load crates.nvim
-- autocmd("BufRead Cargo.toml", {
--     group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
--     pattern = "Cargo.toml",
--     callback = function()
--         require("nvim-cmp").setup.buffer({ sources = { { name = "crates" } } })
--     end,
-- })

require "custom.chadrc"
