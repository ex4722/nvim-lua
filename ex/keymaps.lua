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


-- Undo Tree 
k("n", "<A-u>", ":UndotreeToggle<CR>", conf)


-- Moving buffers
k("n", "<leader>1", "", conf)
k("n" , "<C-b>", ":w<CR>:exec '!tmux new-window ipython -i' shellescape(@%, 1)<CR>-", conf)


-- NvimTreeee
k("n", "<C-e>", ":NvimTreeToggle<CR>", conf)

-- HARPOOOON
k("n", "H", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", conf)
k("n", "<space>a", ":lua require('harpoon.mark').add_file()<CR>", conf)
k("n", "<space>f", ":lua require('harpoon.ui').nav_file(1)<CR>", conf)
k("n", "<space>d", ":lua require('harpoon.ui').nav_file(2)<CR>", conf)
k("n", "<space>s", ":lua require('harpoon.ui').nav_file(3)<CR>", conf)

-- Tabs
k("n", "<tab>", ":TablineBufferNext<CR>", conf)
k("n", "<S-tab>", ":tabnex<CR>", conf)


-- DAP
k("n", "<F5>", ":lua require'dap'.continue()<CR>", conf)
k("n", "<F1>", ":lua require'dap'.step_into()<CR>", conf)
k("n", "<F2>", ":lua require'dap'.step_over()<CR>", conf)
k("n", "<F3>", ":lua require'dap'.step_out()<CR>", conf)
k("n", "<space>b", ":lua require'dap'.toggle_breakpoint()<CR>", conf)
k("n", "<space>B", ":lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", conf)


-- Fugative 
k("n", "<space>g", ":Neogit<CR>", conf)
k("n", "<leader>g", ":G<CR>", conf)


-- Window Control 
k("n", "s", "<C-w>", conf)
