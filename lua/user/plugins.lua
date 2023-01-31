local packer_ok, packer = pcall(require, "packer")

if not packer_ok then
    return
end

vim.cmd([[packadd packer.nvim]])

packer.init({
    display = {
        prompt_border = "rounded",
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    profile = {
        enable = true,
        threshold = 0,
    },
    max_jobs = 25,
})

return require("packer").startup(function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    -- performance
    use("lewis6991/impatient.nvim")
    use("dstein64/vim-startuptime")
    use("nathom/filetype.nvim")

    -- lsp
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "b0o/SchemaStore.nvim",
        "neovim/nvim-lspconfig",
        "RRethy/vim-illuminate",
        "j-hui/fidget.nvim",
        { "glepnir/lspsaga.nvim", commit = "b7b4777369b441341b2dcd45c738ea4167c11c9e", },
        { "folke/lua-dev.nvim", commit = "8f94b49b982ec4e7644f1e5004ec33c98903d32a", },
    })

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- completions
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-emoji")
    use("hrsh7th/cmp-calc")
    use("onsails/lspkind.nvim")
    use("ray-x/cmp-treesitter")
    use("saadparwaiz1/cmp_luasnip")

    -- treesitter
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/nvim-treesitter-context")
    use("nvim-treesitter/playground")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("windwp/nvim-ts-autotag")
    use("p00f/nvim-ts-rainbow")

    --quickfixlist
    use({ "kevinhwang91/nvim-bqf", ft = "qf" })

    -- status
    use("nvim-lualine/lualine.nvim")

    -- telescope
    use("nvim-telescope/telescope.nvim")

    --git
    use({"akinsho/git-conflict.nvim", tag = "*"})
    use("lewis6991/gitsigns.nvim")

    -- formatter
    use("jose-elias-alvarez/null-ls.nvim")

    -- utility
    use("junegunn/vim-easy-align")
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
    use("moll/vim-bbye")
    use("mbbill/undotree")
    use("christoomey/vim-tmux-navigator")
    use("lukas-reineke/indent-blankline.nvim")
    use("ThePrimeagen/harpoon")

    -- motion
    use("tpope/vim-surround")
    use("tpope/vim-repeat")
    use("tpope/vim-sleuth")
    use("ggandor/leap.nvim")
    use("ggandor/leap-ast.nvim")
    use("ggandor/flit.nvim")
    use("nvim-tree/nvim-web-devicons")

    -- colorscheme
    use({ "AlphaTechnolog/pywal.nvim", as = "pywal" })
    use("rose-pine/neovim")

    -- markdown
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
