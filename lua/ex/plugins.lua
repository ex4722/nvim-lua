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



return packer.startup(function(use)
    -- CORE KIT
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "wbthomason/packer.nvim" 
    use "lifepillar/vim-solarized8"


    -- File Manager
    use "ms-jpq/chadtree"
    use {
        "X3eRo0/dired.nvim",
        requires = "MunifTanjim/nui.nvim",
    }
    use 'justinmk/vim-dirvish'
    use 'kyazdani42/nvim-tree.lua'



    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'Maan2003/lsp_lines.nvim'
    use "williamboman/mason.nvim" 
    use 'lvimuser/lsp-inlayhints.nvim'
    use 'ludovicchabant/vim-gutentags'

    -- Auto Complete 
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'quangnguyen30192/cmp-nvim-tags'

    use 'rafamadriz/friendly-snippets'
    use 'hrsh7th/cmp-nvim-lsp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'windwp/nvim-autopairs'


    -- Git
    use "TimUntersberger/neogit"
    use 'lewis6991/gitsigns.nvim'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'


    -- Telly 
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'ThePrimeagen/git-worktree.nvim'

    use 'junegunn/fzf.vim'
    use 'junegunn/fzf'


    -- Shorcuts
    use 'ThePrimeagen/harpoon'
    use 'tpope/vim-commentary'
    use "machakann/vim-sandwich"
    use 'mbbill/undotree'
    use 'mattn/emmet-vim'



    -- Eye Candy 
    use 'nvim-lualine/lualine.nvim'
    use 'kdheepak/tabline.nvim'

    use 'p00f/nvim-ts-rainbow'

    use 'lukas-reineke/indent-blankline.nvim'

    if PACKER_BOOTSTRAP then 
        require("packer").sync()
    end
end)
