local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        sh = { "beautysh" },
        bash = { "beautysh" },
        sql = { "sql_formatter" }
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
