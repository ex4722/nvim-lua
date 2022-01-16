local fn = vim.fn
--
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
    use "rstacruz/vim-closer"

    -- Code Shortcuts
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    use 'mbbill/undotree'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'

    -- AutoComplete and Snips
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    -- use 'windwp/nvim-autopairs'
    -- use 'jiangmiao/auto-pairs'
    -- use 'rstacruz/vim-closer'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'tami5/lspsaga.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Formatters 
    -- use {'averms/black-nvim', run = ':UpdateRemotePlugins'  } 
    use 'lukas-reineke/indent-blankline.nvim'

    -- Git 
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- Telly 
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use 'nvim-telescope/telescope-media-files.nvim'
   use'ThePrimeagen/harpoon'

    -- Trees
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate",}
    use 'p00f/nvim-ts-rainbow'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    -- Pretty 

    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = false}
    }
    use 'ryanoasis/vim-devicons'
    use 'kdheepak/tabline.nvim'
    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end }

    use 'kyazdani42/nvim-tree.lua'


    if PACKER_BOOTSTRAP then
        require("packer").sync()    
    end
end)