local autocmd = vim.api.nvim_create_autocmd

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


require "custom.chadrc"
