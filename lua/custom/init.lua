local autocmd = vim.api.nvim_create_autocmd

local function db_completion()
  require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
end
-- Open nvim-tree on opening directory
autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open({
      path = vim.fn.getcwd(-1, -1),
      find_file = true,
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


autocmd("FileType", {
  pattern = {
    "sql",
    "mysql",
    "plsql",
  },
  callback = function()
    vim.schedule(db_completion)
  end,
})

require "custom.chadrc"
