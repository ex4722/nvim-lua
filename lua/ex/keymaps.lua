local conf = { noremap = true, silent = true }
local recur = { silent = true }

local k = vim.api.nvim_set_keymap

-- Leader key stuff
vim.g.mapleader = ","
vim.g.maplocalleader = ","

k("n", "<leader><cr>", ":noh<cr>", conf)
k("n", "<leader>q", ":q!<cr>", conf)
k("n", "<leader>x", ":x<cr>", conf)

-- Cursor Location during finds 
k("n", "n", "nzzzv", conf)
k("n", "N", "Nzzzv", conf)
k("n", "J", "mzJ`z", conf)

-- BEST REMAP 
k("i", "jk", "<ESC>", conf)

k("n", "ac", "ggVG", conf)

-- System clipboard
k("", "<C-p>", "<C-r>+", conf)
k("", "Y", "\"+y", conf)

-- Save undo buffers 
-- k("i", ",", ",<c-g>u")
-- k("i", "(", "(<c-g>u")
-- k("i", "[", "[<c-g>u")
-- k("i", ":", ":<c-g>u")


-- Moving text around in visual mode
k("v", "J", ":m '>+1<CR>gv=gv", conf)
k("v", "K", ":m '<-2<CR>gv=gv", conf)
k("v", "<", "<gv", conf)
k("v", ">", ">gv", conf)

k("x", "J", ":m '>+1<CR>gv=gv", conf)
k("x", "K", ":m '<-2<CR>gv=gv", conf)
k("x", "<", "<gv", conf)
k("x", ">", ">gv", conf)



-- Telly 
k("n", ";f", "<cmd>Telescope find_files<cr>", conf)
k("n", ";r", "<cmd>Telescope live_grep<cr>", conf)
k("n", "\\\\", "<cmd>Telescope buffers<cr>", conf)
k("n", ";;", "<cmd>Telescope help_tags<cr>", conf)
k("n", "gf", "<cmd>Telescope lsp_references<cr>", conf)
k("n", ";;", "<cmd>Telescope help_tags<cr>", conf)



-- Undo Tree 
k("n", "<A-u>", ":UndotreeToggle<CR>", conf)

-- Fugative 
k("n", "<leader>gs", ":G<CR>", conf)

-- Moving buffers
k("n", "<leader>1", "", conf)
k("n" , "<C-b>", ":w<CR>:exec '!tmux new-window ipython3 -i' shellescape(@%, 1)<CR>-", conf)


-- NvimTreeee
k("n", "<C-e>", ":NvimTreeToggle<CR>", conf)

-- HARPOOOON
k("n", "ha", ":lua require('harpoon.mark').add_file()<CR>", conf)
k("n", "H", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", conf)

k("n", "<space>f", ":lua require('harpoon.ui').nav_file(1)<CR>", conf)
k("n", "<space>d", ":lua require('harpoon.ui').nav_file(2)<CR>", conf)
k("n", "<space>s", ":lua require('harpoon.ui').nav_file(3)<CR>", conf)
k("n", "<space>a", ":lua require('harpoon.ui').nav_file(4)<CR>", conf)
-- k("n", "H", ":Telescope harpoon marks<CR>", conf)
-- k("n", "<tab>", ":lua require('harpoon.ui').nav_next()<CR>", conf)

k("n", "<tab>", ":TablineBufferNext<CR>", conf)





