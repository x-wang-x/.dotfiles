vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    desc = "Optimizations for prose and documentation writing",
    callback = function()
        vim.opt_local.wrap = true     -- Soft wrap long lines
        vim.opt_local.linebreak = true -- Wrap text at spaces, not mid-word
        vim.opt_local.spell = true    -- Turn on native spell checking
        vim.opt_local.spelllang = "en_us" -- Set language to US English
        vim.opt_local.conceallevel = 2 -- Conceal raw markdown syntax characters (*, _, `)
        -- Fix tab spaces specifically for markdown document styling
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
    end,
})
-- Markdown Actions Group (Only bounds keys inside Markdown buffers)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(event)
        local opts = { buffer = event.buf, silent = true }

        -- Generate a GitHub-Flavored Table of Contents at your cursor
        vim.keymap.set("n", "<leader>tc", "<cmd>GenTocGFM<CR>",
            { buffer = event.buf, desc = "Generate Table of Contents" })

        -- Update your existing Table of Contents automatically
        vim.keymap.set("n", "<leader>tu", "<cmd>UpdateToc<CR>",
            { buffer = event.buf, desc = "Update Table of Contents" })

        -- Spell Check: Jump to next misspelled word and suggest corrections
        vim.keymap.set("n", "]s", "]s", opts)
        vim.keymap.set("n", "[s", "[s", opts)
        vim.keymap.set("n", "<leader>sc", "z=", opts) -- Pulls up quick-fix word options
    end,
})
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open',{clear = true}),
    callback = function ()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
