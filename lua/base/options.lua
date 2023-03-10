local options = {
    syntax         = "on",
    filetype       = "plugin_indent_on",
    fileencoding   = "utf8",
    virtualedit    = "block",
    clipboard      = "unnamedplus",
    completeopt    = { "menuone", "noselect" },
    signcolumn     = "yes",
    mouse          = "a",
    colorcolumn    = "80",
    guifont        = "JetBrainsMono Nerd Font Mono:h12",
    guicursor      = "",
    exrc           = true,
    autoread       = true,
    hidden         = true,
    number         = true,
    relativenumber = true,
    backup         = false,
    hlsearch       = true,
    incsearch      = true,
    splitright     = true,
    splitbelow     = true,
    swapfile       = false,
    termguicolors  = true,
    writebackup    = false,
    cursorline     = true,
    wrap           = false,
    ignorecase     = true,
    expandtab      = true,
    smartindent    = true,
    autoindent     = true,
    smartcase      = true,
    pumheight      = 10,
    timeoutlen     = 200,
    updatetime     = 300,
    sidescrolloff  = 30,
    scrolloff      = 30,
    shiftwidth     = 4,
    tabstop        = 4,
    softtabstop    = 4,
    numberwidth    = 4,
    cmdheight      = 1,
    conceallevel   = 0,
    laststatus     = 3,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.g.netrw_browsex_viewer = "open"
vim.g.did_load_filetypes = 1

vim.g.python3_host_prog = '/usr/bin/python3'
