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


require("options")
require("lazy").setup("plugins")

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
