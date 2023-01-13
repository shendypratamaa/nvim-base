local M = {}

local saga_ok, saga = pcall(require, "lspsaga")

if not saga_ok then
    return
end

local cfg = {
    border_style = "rounded",
    saga_winblend = 0,
    move_in_saga = { prev = "<C-p>", next = "<C-n>" },
    diagnostic_header = { "😡 ", "😥 ", "😤 ", "😐 " },
    max_preview_lines = 15,
    code_action_icon = "💡",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = false,
        sign = true,
        enable_in_insert = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_icons = {
        def = "  ",
        ref = "諭 ",
        link = "  ",
    },
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<C-c>",
    symbol_in_winbar = {
        enable = true,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
    },
    show_outline = {
        win_position = "right",
        left_with = "",
        win_width = 50,
        auto_enter = true,
        auto_preview = true,
        virt_text = "┃",
        jump_key = "o",
        auto_refresh = true,
    },
    server_filetype_map = {},
}

function M.setup()
    saga.init_lsp_saga(cfg)
end

return M
