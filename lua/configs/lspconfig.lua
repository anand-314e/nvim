-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "pyright", "bashls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

-- -- python
-- lspconfig.pyright.setup {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--     filetypes = { "python" },
-- }
--
-- -- python
-- lspconfig.bash_language_server.setup {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--     filetypes = { "sh" },
-- }
