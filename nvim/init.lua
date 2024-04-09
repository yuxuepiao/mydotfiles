require("options")
require("plugins")

--vim.api.nvim_create_autocmd("BufEnter",{
--  callback = function()
--    vim.lsp.start({
--      name = 'clangd',
--      cmd = {'/home/ypiao/clangd_17.0.3/bin/clangd'},
--      root_dir = vim.fn.getcwd(),
--    })
--  end,
--})


--print("Hello World");

-- concept of table, is data structure.
-- global table

-- setup lazy.nvim

-- :checkhealth lazy
-- all processes go as async
-- split plugin split files
