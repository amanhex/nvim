local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup {
    { "ellisonleao/gruvbox.nvim" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
    { "windwp/nvim-autopairs" },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
    },
    { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    "norcalli/nvim-colorizer.lua",

    "terrortylor/nvim-comment",
    "xiyaowong/transparent.nvim",
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("nvim-tree").setup {} end,
    },
    {
        "rockyzhang24/arctic.nvim",
        dependencies = { "rktjmp/lush.nvim" },
        name = "arctic",
        branch = "main",
        priority = 1000,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            require("moonfly").custom_colors {
                bg = "#000000",
            }
            vim.cmd [[colorscheme moonfly]]
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function() require("dashboard").setup() end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "windwp/nvim-ts-autotag",
        config = function() require("nvim-ts-autotag").setup() end,
    },
    { "lewis6991/gitsigns.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = function()
            require("ibl").setup {
                exclude = {
                    filetypes = {
                        "dashboard",
                    },
                },
            }
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
            },
            format_on_save = true,
        },
    },
    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
            "stevearc/resession.nvim", -- Optional, for persistent history
        },
        config = true,
    },
}
