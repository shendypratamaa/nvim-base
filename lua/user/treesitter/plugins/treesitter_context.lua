local context_ok, tree = pcall(require, "treesitter-context")

if not context_ok then
    return
end

local cfg = {
    enable = true,
    trim_scope = "outer",
    max_lines = 0,
    min_window_height = 0,
    patterns = {
        default = {
            "function",
            "variable_declaration",
        },
        markdown = {
            "section",
        },
    },
    zindex = 20,
    mode = "topline",
    separator = nil,
}

tree.setup(cfg)
