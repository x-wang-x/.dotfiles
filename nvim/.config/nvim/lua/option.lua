-- disable banner
vim.g.netrw_banner = 0
-- show line number
vim.o.number = true
vim.o.relativenumber = true

vim.opt.expandtab = true
-- using terminal 24-bit color
vim.opt.termguicolors = true

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true -- horizontal split => below
vim.opt.splitright = true -- vertical split => right

vim.opt.ignorecase = true -- case insensitive
vim.opt.smartcase = true  -- case sensitive if got capital letter

vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
vim.opt.guicursor = ""
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.o.cmdheight = 0

-- fold

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.api.nvim_create_autocmd("TextYankPost",
    {
        desc = "Highlight when yanking (copying) text",
        callback = function()
            vim.hl.on_yank()
        end,
    })
