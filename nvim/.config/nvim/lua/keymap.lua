vim.g.mapleader = " "

local keymap = vim.keymap.set
---- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
keymap("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "All Buffers" })
keymap("n", "<leader>fr", "<cmd>Telescope buffers<CR>", { desc = "All Buffers" })
keymap("n", "<leader>x", ":bd<CR>", { desc = "Recent Files" })
---- Save and / or quit
keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "QQ", ":q!<CR>")
keymap("n", "WW", ":w<CR>")
---- Save with Ctrl + s
keymap({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })
---- Change mode
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })
---- Clear highlight (searching)
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
---- Undotree
keymap('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

