local M = {}

local nls_ok, nls = pcall(require, "null-ls")

if not nls_ok then
    return
end

local fn           = vim.fn
local formatting   = nls.builtins.formatting
local diagnostics  = nls.builtins.diagnostics
local code_actions = nls.builtins.code_actions

local prettier = "~/.config/formatter/prettier/.prettierrc.json"
local eslint   = "~/.config/formatter/eslint/.eslintrc.json"
local flake8   = "~/.config/formatter/flake8/.flake8"
local stylua   = "~/.config/nvim/stylua.toml"

local sources = {
    -- golang
    formatting.gofumpt,
    formatting.goimports,
    formatting.golines,
    diagnostics.golangci_lint,

    -- javascript / typescript
    formatting.prettier.with({
        extra_args = {
            "--config",
            fn.expand(prettier),
        },
    }),
    diagnostics.eslint_d.with({
        extra_args = {
            "--config",
            fn.expand(eslint)
        }
    }),
    code_actions.eslint_d,

    -- lua
    formatting.stylua.with({
        extra_args = {
            "--config-path",
            fn.expand(stylua),
        },
    }),

    -- python
    formatting.isort,
    formatting.black.with({
        extra_args = { "--fast" },
    }),
    diagnostics.flake8.with({
        extra_args = {
            "--config",
            fn.expand(flake8),
        },
    }),

    -- markdown
    formatting.markdownlint,
    diagnostics.markdownlint,

    -- json
    formatting.fixjson,

    -- shell
    formatting.shfmt,
    diagnostics.shellcheck,

    -- code-actions
    code_actions.gitsigns,
}

function M.setup(on_attach)
    nls.setup({
        debug              = false,
        debounce           = 150,
        diagnostics_format = "[#{c}] #{m}",
        sources            = sources,
        on_attach          = on_attach,
    })
end

return M
