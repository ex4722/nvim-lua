local status, installer = pcall(require, "nvim-lsp-installer")
if not status then
    print("nvim-lsp-installer not installed")
    return
end


installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("ex.lsp.handlers").on_attach,
        capabilities = require("ex.lsp.handlers").capabilities

    }
    -- (optional) Customize the options passed to the server

    if server.name == "sumneko_lua" then
        local sum_opts = require("ex.lsp.settings.sumneko_lua")
        opts = vim.tbl_extend("force", sum_opts, opts)
    end

    server:setup(opts)
end)

require("mason").setup()
-- require'lspconfig'.jedi_language_server.setup{}
-- require'lspconfig'.pyright.setup{}
