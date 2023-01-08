local harpoon_ok, harpoon = pcall(require, "harpoon")

if not harpoon_ok then
    return
end

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "\\a", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "\\w", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

keymap("n", "<leader>1", ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap("n", "<leader>2", ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap("n", "<leader>3", ':lua require("harpoon.ui").nav_file(3)<CR>', opts)

keymap("n", "<leader>n", ':lua require("harpoon.ui").nav_next()<CR>', opts)
keymap("n", "<leader>p", ':lua require("harpoon.ui").nav_prev(3)<CR>', opts)

local cfg = {
    menu = {
        width = 60,
        height = 10,
    },
}

harpoon.setup(cfg)
