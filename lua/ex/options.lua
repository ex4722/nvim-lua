local options = {
    scrolloff = 10,
    smartindent = true,
    number = true,
    relativenumber = true,
    shiftround = true,
    shiftwidth = 4,
    softtabstop = 4,
    linebreak = true,
    sidescrolloff= 15,
    wrap = false,
    visualbell = false,
    termguicolors = true,
    hidden = true,
    swapfile = false,


    undofile = true,
    undodir = "/home/ex/.config/nvim/undodir",
    signcolumn = "yes",

    ignorecase = true,
    smartcase = true,
    incsearch = true,
    expandtab = true,
    guicursor = '',
    mouse = 'c',
}

for opt, value in pairs(options) do
    vim.opt[opt] = value
end

vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
vim.wo.fillchars='eob: '


-- Colors 
vim.cmd "set background=dark"
vim.cmd "colorscheme solarized8"
vim.cmd ([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])
vim.cmd ([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd ([[set t_Co=256]])
vim.cmd ([[hi VertSplit guibg=002b36]])
