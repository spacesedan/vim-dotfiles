-- This file can be loaded by calling `lua require('plugins')` from your init.vim



-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim', } }
    }


    -- Different theme setups
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })

    -- use({
    --     'projekt0n/github-nvim-theme',
    --     config = function()
    --         require('github-theme').setup({
    --             theme_style = "dark",
    --             transparent = true
    --         })
    --     end
    -- })

    use({
        'luisiacc/gruvbox-baby',
        as = 'gruvbox-baby',
        config = function()
            vim.g.gruvbox_baby_transparent_mode = true
            vim.cmd.colorscheme('gruvbox-baby')
        end
    })
    -- tmux & split window navigation
    use('christoomey/vim-tmux-navigator')

    -- maximizes and restores current window
    use("szw/vim-maximizer")

    -- essential plugins
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with gc
    use('numToStr/Comment.nvim')

    -- file explorer
    -- use('nvim-tree/nvim-tree.lua')

    --icons
    use('nvim-tree/nvim-web-devicons')

    -- statusline
    use('nvim-lualine/lualine.nvim')

    -- edit filetypes
    use {
        "nathom/filetype.nvim",
        config = function()
            require("filetype").setup {
                overrides = {
                    extensions = {
                        tf = "terraform",
                        tfvars = "terraform",
                        tfstate = "json",
                    },
                },
            }
        end,

    }

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use('jose-elias-alvarez/null-ls.nvim')
end)
