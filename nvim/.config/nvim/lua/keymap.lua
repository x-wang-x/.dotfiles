vim.g.mapleader = " "

local keymap = vim.keymap.set
---- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
keymap("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "All Buffers" })
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
---- Undotree
keymap('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })
---- Replaces selected text WITHOUT losing what you yanked
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
---- Delete text without saving it to any register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
---- Clear highlight (searching)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })
---- Move selected line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" }) 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
---- Join line without moving cursor
vim.keymap.set("n", "J", "mzJ’z", { desc = "Join lines without moving cursor" }) 
---- Cusor stay on center when scrolling 
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" }) 
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" }) 
---- Cursor stay on center when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })
