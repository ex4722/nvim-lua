handler = require("ex.lsp.handler")

handler.setup()


require('lspconfig')['pyright'].setup{
    on_attach = handler.on_attach,
    capabilities = handler.capabilities,
    flags = lsp_flags,
}


require('lspconfig')['clangd'].setup{
    on_attach = handler.on_attach,
    capabilities = handler.capabilities,
    flags = lsp_flags,
}

require('lspconfig')['sumneko_lua'].setup{
    on_attach = handler.on_attach,
    capabilities = handler.capabilities,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },

    }
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 
require('lspconfig')['html'].setup {
    capabilities = capabilities,
    on_attach = handler.on_attach,
    flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup{}
