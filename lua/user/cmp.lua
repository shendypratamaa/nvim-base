local cmp_status_ok, cmp  = pcall(require, "cmp")
local context             = require("cmp.config.context")
local snip_ok, luasnip    = pcall(require, "luasnip")
local lspkind_ok, lspkind = pcall(require, "lspkind")

if not cmp_status_ok and snip_ok and lspkind_ok then
    return
end

local cmp_mapping = cmp.mapping.preset.cmdline()
local cmp_view = { entries = { name = "wildmenu", separator = " | " } }

cmp.setup.cmdline(":", {
    mapping = cmp_mapping,
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

cmp.setup.cmdline("/", {
    view = cmp_view,
    mapping = cmp_mapping,
    sources = cmp.config.sources({
        { name = "buffer" },
    }),
})

local setup = {
    enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "prompt" then
            return false
        end
        return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
    end,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete({
            config = {
                sources = {
                    { name = "luasnip" },
                },
            },
        }),

        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes(
                        "<Plug>luasnip-expand-or-jump",
                        true,
                        true,
                        true
                    ),
                    ""
                )
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes(
                        "<Plug>luasnip-jump-prev",
                        true,
                        true,
                        true
                    ),
                    ""
                )
            else
                fallback()
            end
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            before = function(entry, vim_item)
                vim_item.menu = ({
                    luasnip = "[Snippets]",
                    nvim_lsp = "[LSP]",
                    path = "[Path]",
                    cmdline = "[C]",
                    buffer = "[Buffers]",
                    treesitter = "[Treesitter]",
                    calc = "[Calculation]",
                    emoji = "[Emoji]",
                    neorg = "[Norg]",
                })[entry.source.name]

                if entry.source.name == "nvim_lsp" then
                    vim_item.dup = 0
                end

                return vim_item
            end,
        }),
    },
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "emoji" },
        { name = "neorg" },
        { name = "calc" },
        { name = "treesitter" },
        {
            name = "buffer",
            keyword_length = 5,
            option = {
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end,
            },
        },
        {
            name = "path",
            option = {
                triling_slash = true,
            },
        },
    }),
}

cmp.setup(setup)
