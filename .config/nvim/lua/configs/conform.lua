local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports" },
        c = { "clang_format" },
        cpp = { "clang_format" },
    },

    format_on_save = false
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
}

return options
