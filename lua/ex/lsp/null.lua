-- null_ls = require("null-ls")

-- local formatting = null_ls.builtins.formatting

-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.completion.spell,
--         null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
--         null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
--         null_ls.builtins.formatting.prettier, -- prettier, eslint, eslint_d, or prettierd
--         null_ls.builtins.code_actions.gitsigns,
--         -- null_ls.builtins.formatting.black,
--         formatting.black.with({ extra_args = { "--fast" } }),
--     },
-- })



-- local lspconfig = require("lspconfig")
-- lspconfig.tsserver.setup()



require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.formatting.black,
    },
})
