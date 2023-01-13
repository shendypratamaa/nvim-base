local lsp_ok, lsp_config = pcall(require, "lspconfig")
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
local lv_ok, lv = pcall(require, "lua-dev")
local scheme_ok, scheme = pcall(require, "schemastore")

if not lsp_ok and cmp_ok and lv_ok and scheme_ok then
    return
end

local function disableDiagnostics()
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
        })
end

local on_attach = function(client)
    require("user.lsp.lspsaga").setup()
    require("user.lsp.lspkeymaps").setup()
    require("user.lsp.illuminate").setup()

    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
        disableDiagnostics()
    end

    if client.name == "gopls" then
        client.server_capabilities.document_formatting = false
        disableDiagnostics()
    end

    if client.name == "bashls" then
        client.server_capabilities.document_formatting = false
        disableDiagnostics()
    end

    if client.name == "sumneko_lua" then
        client.server_capabilities.document_formatting = false
        disableDiagnostics()
    end

    if client.name == "pyright" then
        client.server_capabilities.document_formatting = false
        disableDiagnostics()
    end

    if client.name == "yamlls" then
        client.server_capabilities.document_formatting = false
        disableDiagnostics()
    end

    if client.name == "jsonls" then
        client.server_capabilities.document_formatting = false
    end

    if client.name == "html" then
        client.server_capabilities.document_formatting = false
    end
end

local update_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp.default_capabilities(update_capabilities)

local servers = {
    jsonls = {
        settings = {
            json = {
                schemas = scheme.json.schemas(),
            },
        },
    },
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
    tsserver = { disable_formatting = true },
    pyright = {
        analysis = {
            typeCheckingMode = "off",
        },
    },
    html = {},
    cssls = {},
    tailwindcss = {},
    emmet_ls = {},
    yamlls = {},
    bashls = {},
    gopls = {},
}

local formatter = {
    "stylua",
    "prettier",
    "markdownlint",
    "write-good",
    "eslint_d",
    "fixjson",
    "shfmt",
    "shellcheck",
    "golangci-lint",
    "gofumpt",
    "goimports",
    "golines",
}

local lsp_flags = {
    debounce_text_changes = 150,
}

for server_name, _ in pairs(servers) do
    local opts = {
        flags = lsp_flags,
        on_attach = on_attach,
        capabilities = capabilities,
    }

    opts = vim.tbl_deep_extend("force", opts, servers[server_name] or {})
    lsp_config[server_name].setup(opts)

    if server_name == "sumneko_lua" then
        lsp_config.sumneko_lua.setup(lv.setup({
            lspconfig = opts,
        }))
    end
end

require("user.lsp.handlers").setup()
require("user.lsp.null_ls").setup(on_attach)
require("user.lsp.mason").setup(servers, formatter)
