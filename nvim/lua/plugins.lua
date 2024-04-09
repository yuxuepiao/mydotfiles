local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- vim.opt.rtp.prepend(vim.opt.rtp, lazypath)

-- table syntax {}
require("lazy").setup({
    { -- kanagawa color schem
        "rebelot/kanagawa.nvim",
        config = function()    -- call back function after successfully download plugin
            --vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
    { -- catpupuccin
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()    -- call back function after successfully download plugin
            vim.cmd.colorscheme("catppuccin")  -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
        end,
    },
    { -- nvim treesitter
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup ({
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "c", "cpp", "lua", "java", "python", "scheme", "commonlisp", "racket", "disassembly", "cmake", "rust"},

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                -- List of parsers to ignore installing (or "all")
                -- ignore_install = { "javascript" },

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    enable = true,

                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>is", -- set to `false` to disable one of the mappings
                        node_incremental = "<Leader>ns",
                        scope_incremental = "<Leader>ss",
                        node_decremental = "<Leader>ds",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                    -- You can optionally set descriptions to the mappings (used in the desc parameter of
                    -- nvim_buf_set_keymap) which plugins like which-key display
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                -- You can choose the select mode (default is charwise 'v')
      
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'V', or '<c-v>') or a table
                -- mapping query_strings to modes.
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
        config = function()
            require("ibl").setup({})
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() 
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end,
    },
    --[[
    {
        "",
        config = function()
            require("").setup({
                {},
            })
        end,
    },
    --]]--
})

