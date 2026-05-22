vim.o.number = true vim.o.relativenumber = true -- set box sizing
vim.opt.laststatus = 3 -- Global statusline
vim.opt.cmdheight = 1 -- This provides the "gap" at the bottom
vim.opt.clipboard = "unnamedplus"
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
}
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
-- Delete buffer
local d_buffer = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	if selection and selection.bufnr then
		actions.delete_buffer(prompt_bufnr)
	else
		print("Not an active buffer.")
	end
end
-- Delete file
local hard_d = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	local filename = selection.path or selection.filename
	if not filename then
		return
	end
	-- Confirmation
	vim.ui.input({ prompt = "Delete " .. filename .. " from disk? (y/n): " }, function(input)
		if input == "y" or input == "Y" then
			if selection.bufnr then
				actions.delete_buffer(prompt_bufnr)
			end
			os.remove(filename)
			print("Deleted: " .. filename)
		end
	end)
	actions.close(prompt_bufnr)
end

-- Run the setup using the variables defined above
telescope.setup({
	defaults = {
		winblend = 0,
		mappings = {
			i = {
				["<C-d>"] = d_buffer,
				["<C-x>"] = hard_d,
				["<C-n>"] = function(prompt_bufnr)
					actions.close(prompt_bufnr)
					vim.ui.input({ prompt = "New file: " }, function(input)
						if input and input ~= "" then
							vim.cmd("edit " .. input)
						end
					end)
				end,
				["QQ"] = function(prompt_bufnr)
					actions.close(prompt_bufnr)
				end,
			},
		},
	},
	pickers = {
		buffers = {
			hidden = true,
			show_all_buffers = true,
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
		},
	},
})

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
require("lualine").setup({
	options = {
		theme = "carbonfox", 
	},
})
require("keymap")
vim.cmd.colorscheme("catppuccin")
