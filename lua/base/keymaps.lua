local opts      = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap    = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Resize with arrows
keymap("n", "<C-w>j", ":resize +5<CR>", opts)
keymap("n", "<C-w>k", ":resize -5<CR>", opts)
keymap("n", "<C-w>l", ":vertical resize -5<CR>", opts)
keymap("n", "<C-w>h", ":vertical resize +5<CR>", opts)

-- split panes
keymap("n", "ss", ":sv<CR>", opts)
keymap("n", "sv", ":vs<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv-gv", opts)
keymap("x", "K", ":m '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)

-- navigation buffer, netrw --
keymap("n", "]q", ":cn<CR>", opts)
keymap("n", "[q", ":cp<CR>", opts)
keymap("n", "<S-l>", ":bn<CR>", opts)
keymap("n", "<S-h>", ":bp<CR>", opts)
keymap("n", "<C-n>", ":Lex 20<CR>", opts)
keymap("n", "<S-q>", "<C-^>", opts)

-- remove panes, mark, highlighting --
keymap("n", "\\wq", "<C-w>o<CR>", term_opts)
keymap("n", "\\s", ":w<CR>:wshada!<CR>", opts)
keymap("n", "nq", ":nohls<CR>", opts)

-- Fix-behave
keymap("n", "Y", "yg$", opts)
keymap("n", "mm", "zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)
keymap("x", "<leader>p", '"_dP', opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- external buffer remove bbye
keymap("n", "\\q", ":Bwipeout<CR><C-w>o<CR>", term_opts)
