local status, nls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not status then
    return
end


nls.setup({
    sources = {
        nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
        -- nls.builtins.diagnostics.eslint_d,
        nls.builtins.formatting.prettier.with({
            extra_args = { "--single-quote", "false" },
        }),
        nls.builtins.formatting.terraform_fmt,
        nls.builtins.formatting.black,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.latexindent.with({
            extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
        }),
        nls.builtins.formatting.sql_formatter,
        nls.builtins.formatting.rustfmt,
        nls.builtins.formatting.yamlfmt,
        nls.builtins.code_actions.shellcheck,
        nls.builtins.diagnostics.vale,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.formatting.terraform_fmt
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
