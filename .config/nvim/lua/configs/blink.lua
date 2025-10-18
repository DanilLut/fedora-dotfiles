return {
    completion = {
        menu = {
            auto_show = false,
        },
    },
    keymap = {
        ["<C-space>"] = { function(cmp)
            cmp.show({ providers = { "lsp", "buffer", "snippets", "path" } })
        end },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-b>'] = { 'snippet_forward', 'fallback' },
        ['<C-f>'] = { 'snippet_backward', 'fallback' },
        ['<S-Tab>'] = { 'scroll_documentation_up', 'fallback' },
        ['<Tab>'] = { 'scroll_documentation_down', 'fallback' },
    },
}
