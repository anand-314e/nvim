require "nvchad.mappings"

local map = vim.keymap.set

map('n', '<leader>ih',
    function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }))
    end
)
map("n", "<leader>sh", vim.lsp.buf.signature_help)
map('n', '<space>e', vim.diagnostic.open_float)

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map("n", "C-h", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "navigate left" })
-- map("n", "C-j", "<Cmd>NvimTmuxNavigateDown<CR>")
-- map("n", "C-k", "<Cmd>NvimTmuxNavigateUp<CR>")
-- map("n", "C-l", "<Cmd>NvimTmuxNavigateRight<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
