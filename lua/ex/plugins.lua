local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Core Kit
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "wbthomason/packer.nvim"
    use "lifepillar/vim-solarized8"

    -- Build system
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}


    use "norcalli/nvim-colorizer.lua"

    -- Quality of Life
    use 'mbbill/undotree'
    use 'tpope/vim-commentary'
    use "machakann/vim-sandwich"
    -- use 'tpope/vim-surround'
    use 'windwp/nvim-autopairs'
    -- use 'jiangmiao/auto-pairs'
    -- use 'rstacruz/vim-closer'
    use 'mattn/emmet-vim'
    use 'p00f/nvim-ts-rainbow'
    use { "folke/which-key.nvim", }
    use { 'kyazdani42/nvim-tree.lua',}

    -- AutoComplete and Snips
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'




    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use { "williamboman/mason.nvim" }
    use 'tami5/lspsaga.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Formatters 
    -- use {'averms/black-nvim', run = ':UpdateRemotePlugins'  } 
    use 'lukas-reineke/indent-blankline.nvim'
    use 'euclio/vim-markdown-composer'


    -- Git 
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'ThePrimeagen/git-worktree.nvim'
    use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Telly 
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use 'nvim-telescope/telescope-media-files.nvim'
    use'ThePrimeagen/harpoon'

    -- Trees
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate",}
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    -- Pretty 
    use 'kyazdani42/nvim-web-devicons'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = false} }
    use 'kdheepak/tabline.nvim'


    use "mong8se/actually.nvim"



    -- Dab on dem
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'


    -- FUNNNN
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
