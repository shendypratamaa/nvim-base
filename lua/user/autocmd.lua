vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd([[
      set formatoptions-=cro
      set wildignore+=*.meteor*
      set wildignore+=*vim/backups*
      set wildignore+=*sass-cache*
      set wildignore+=*cache*
      set wildignore+=*logs*
      set wildignore+=*node_modules/**
      set wildignore+=*DS_Store*
      set wildignore+=*.gem
      set wildignore+=log/**
      set wildignore+=tmp/**
      set wildignore+=*.png,*.jpg,*.gif
      set nocompatible
      set iskeyword+=-
      set whichwrap+=<,>,[,],h,l
      set nofoldenable
      set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
      set grepformat=%f:%l:%c:%m
      let g:vimwiki_list = [{'path': '~/vimwiki/',
                            \ 'syntax': 'markdown', 'ext': '.md'}]
    ]])
    end,
})

-- trim whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- bind q for close specified filetypes
vim.api.nvim_create_autocmd({ "Filetype" }, {
    pattern = {
        "qf",
        "help",
        "man",
        "lspinfo",
        "startuptime",
        "lspsagaoutline",
        "undotree_2",
        "toggleterm",
        "null-ls-info",
        "tsplayground",
        "fzf",
    },
    callback = function()
        vim.keymap.set("n", "q", ":q!<CR>", { silent = true })
        vim.cmd([[ set nobuflisted ]])
    end,
})
