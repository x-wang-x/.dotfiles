vim.g.mapleader = " "

local keymap = vim.keymap.set
--- Oil
keymap("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Oil Filemanager" })
keymap("n", "<leader>_", "<CMD>Oil --float<CR>", { desc = "Floating Oil Filemanager" })
---- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
keymap("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "All Buffers" })
keymap("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "Show all keymaps" })
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
keymap('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true },{desc = "Toggle undotree"})
---- Replaces selected text WITHOUT losing what you yanked
keymap("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
---- Delete text without saving it to any register
keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
---- Clear highlight (searching)
keymap("i", "<C-c>", "<Esc>")
keymap("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })
--- Move line
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" }) 
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
---- Move selected line
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" }) 
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
---- Join line without moving cursor
keymap("n", "J", "mzJ’z", { desc = "Join lines without moving cursor" }) 
---- Cusor stay on center when scrolling 
keymap("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" }) 
keymap("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" }) 
---- Cursor stay on center when searching
keymap("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })
---- Better indent
keymap("v", "<", "<gv", { desc = "Indent left and reselect" }) 
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })
