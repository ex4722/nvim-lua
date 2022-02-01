local options = {
    -- syntax = true,
    -- guicursor = false,

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
   undodir = "/home/ex4722/.config/nvim/undodir",
    signcolumn = "yes",
   
    ignorecase = true,
    smartcase = true,
    incsearch = true,
    expandtab = true,
    guicursor = '',

}
for opt, value in pairs(options) do
    vim.opt[opt] = value
end
