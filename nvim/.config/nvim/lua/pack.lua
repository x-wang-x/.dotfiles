vim.pack.add { 
	--oil fm
	'https://github.com/stevearc/oil.nvim' ,
	--undo tree
	'https://github.com/jiaoshijie/undotree',
	--telescope
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	--theme
	'https://github.com/edeneast/nightfox.nvim',
	'https://github.com/catppuccin/nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
	--lualine
	'https://github.com/nvim-lualine/lualine.nvim',
    --surround
    'https://github.com/nvim-mini/mini.surround',
    --notify
    'https://github.com/nvim-mini/mini.notify',
    --treesitter
    "https://github.com/nvim-treesitter/nvim-treesitter"
}
require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require("oil").setup({
	columns = {
		"icon",
		-- "permissions",
		"size",
		"mtime",
	},
})
require("catppuccin").setup({
	flavour = "mocha",
	term_colors = true, 
	transparent_background = true,
})
require('mini.surround').setup({
    mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding}
    },
}) 
local mini_notify = require('mini.notify')
mini_notify.setup()
-- mini_notify.setup({
-- content = {
--     format = function(notif)
--         return notif.msg
--     end,
--   },
-- })
require("lualine").setup({
	options = {
		theme = "catppuccin-frappe", 
	},
})
