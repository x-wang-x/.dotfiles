vim.pack.add {
    --oil fm
    'https://github.com/stevearc/oil.nvim',
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
    "https://github.com/nvim-treesitter/nvim-treesitter",
    --LSP
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/nvim-mini/mini.completion",
    -- Markdown utility
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/jakewvincent/mkdnflow.nvim",
    "https://github.com/mzlogin/vim-markdown-toc"
}
require("mason").setup()
require("mason-lspconfig").setup()
require('mini.completion').setup()
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "/usr/share/hypr/stubs",
                },
                maxPreload = 1000,
                preloadFileSize = 150,
            },
            diagnostics = {
                globals = { "vim", "require", "hl" },
                disable = { "missing-fields", "inject-field" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 'rust', 'javascript', 'bash', 'json', 'javascript', 'typescript', 'html', 'go' }
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
        add = 'sa',       -- Add surrounding in Normal and Visual modes
        delete = 'sd',    -- Delete surrounding
        find = 'sf',      -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr',   -- Replace surrounding}
    },
})
local mini_notify = require('mini.notify')
mini_notify.setup()
require("lualine").setup({
    options = {
        theme = "catppuccin-frappe",
    },
})
require('render-markdown').setup({
  file_types = { 'markdown' },
  heading = {
    -- Adds clean background bars/icons to H1, H2, H3, etc.
    sign = true,
    icons = { '█─ ', '██─ ', '███─ ', '#### ', '##### ', '###### ' },
  },
  code = {
    sign = false,
    width = 'block', -- Extends the background highlight window fully across the block
    right_pad = 4,
  },
  checkbox = {
    enabled = true,
    unchecked = { icon = '󰄱 ' },
    checked = { icon = ' ' },
  },
  pipe_table = {
    preset = 'round', -- Generates beautiful rounded borders around raw text markdown tables
  }
})

require('mkdnflow').setup({
    modules = {
        bib = true,
        buffers = true,
        conceal = true,
        cursor = true,
        folds = true,
        foldtext = true,
        links = true,
        lists = true,
        maps = true,
        paths = true,
        tables = true,
        to_do = true,
        yaml = false,
    notebook = true,
    }
})
