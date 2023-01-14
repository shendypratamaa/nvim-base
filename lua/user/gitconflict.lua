local git_conflict_ok, git_conflict = pcall(require, "git-conflict")

if not git_conflict_ok then
    return
end

local keymap = vim.keymap.set

keymap("n", "co", "<Plug>(git-conflict-ours)")
keymap("n", "ct", "<Plug>(git-conflict-theirs)")
keymap("n", "cb", "<Plug>(git-conflict-both)")
keymap("n", "c0", "<Plug>(git-conflict-none)")
keymap("n", "]x", "<Plug>(git-conflict-prev-conflict)")
keymap("n", "[x", "<Plug>(git-conflict-next-conflict)")

vim.api.nvim_set_hl(0, "DiffText", { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#ffffff", bg = "#1d3450" })

git_conflict.setup()
