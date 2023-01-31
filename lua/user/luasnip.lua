local ls_ok, ls = pcall(require, "luasnip")

if not ls_ok then
    return
end

ls.snippet = {
    html = {},
}

ls.filetype_extend("javascript", { "html" })
ls.filetype_extend("javascriptreact", { "html" })
ls.filetype_extend("typescriptreact", { "html" })
ls.filetype_extend("html", { "javascript" })

require("luasnip.loaders.from_vscode").load({
    include = { "html", "javascript" },
})
require("luasnip.loaders.from_vscode").lazy_load()
