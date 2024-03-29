local M = {}


M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "", guibg="#073642"  })
    end

    local config = {
        -- disable virtual text, lsp_lines will work
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },

        update_in_insert = true,
        underline = true,
        severity_sort = true,

        float = {
            focusable = false,
            style = "minimal",
            -- border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

--     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--         border = "rounded",
--     })
-- 
--     vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--        -- border = "rounded",
--    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
        [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
        false
        )
    end
end


local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local k = vim.api.nvim_buf_set_keymap

    k(bufnr, "n", "gr", "<cmd>Lspsaga rename<cr>", opts)
 
    -- k(bufnr, "n", "<C-k>", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    -- k(bufnr, "n", "K", "<Cmd>Lspsaga signature_help<CR>", opts)
    k(bufnr, "n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)


    k(bufnr, "n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", opts)
    k(bufnr, "n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)

    k( bufnr, "n", "gl", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)



    k(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    k(bufnr, "n", "gd", ":Lspsaga peek_definition<CR>", opts)


    -- k(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)



    k(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    k(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

    k(bufnr, 'i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)


    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

end

vim.cmd('hi LspSagaFinderSelection guifg=#d33682')
vim.cmd('hi FloatBorder guifg=#b3deef')
vim.cmd('hi NormalFloat guibg=#002b36 guifg=#268bd2')

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
--    require("lsp_lines").setup()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return M
