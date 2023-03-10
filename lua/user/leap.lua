local leap_ok, leap = pcall(require, "leap")
local flit_ok, flit = pcall(require, "flit")
local keymap        = vim.keymap.set
local hl            = vim.api.nvim_set_hl

if not leap_ok and flit_ok then
    return
end

local flit_cfg = {
    keys          = { f = "f", F = "F", t = "t", T = "T" },
    labeled_modes = "v",
    multiline     = false,
    opts          = {},
}

local leap_cfg = {
    case_sensitive      = false,
    equivalence_classes = { " \t\r\n" },
    special_keys = nil,
    hl(0, "LeapBackdrop",     { fg = "#707070" }),
}

keymap({ "n", "x", "o" }, "vn", function()
require("leap-ast").leap()
end, { silent = true, desc = "Leap Motion" })

keymap("n", "s", "<Plug>(leap-forward)", {silent = true, desc = "leap forward"})
keymap("n", "S", "<Plug>(leap-backward)", {silent = true, desc = "leap backward"})
keymap("n", "gs", "<Plug>(leap-cross-window)", {silent = true, desc = "leap cross window"})

flit.setup(flit_cfg)
leap.setup(leap_cfg)
