null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
        formatting.black.with({ extra_args = { "--fast" } }),
    },
})
