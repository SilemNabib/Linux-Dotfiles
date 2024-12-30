return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,

    config = function ()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            flavour = "mocha", -- Choose your Catppuccin flavor here
            transparent_background = true,
            integrations = {
                nvimtree = true, -- Enable integration with Neo-tree
                treesitter = true,
                lsp_trouble = true,
                telescope = true,
                cmp = true, -- Completion plugin
                gitsigns = true, -- Git signs
            },
        })

        vim.o.termguicolors = true
        vim.cmd.colorscheme "catppuccin"

        -- Toggle transparency
        local toggle_transparency = function()
            catppuccin.setup({
                transparent_background = not catppuccin.options.transparent_background -- Enable this to hide Catppuccin background
            })
            vim.cmd.colorscheme("catppuccin")
        end

        vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end
}