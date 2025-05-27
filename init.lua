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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`
vim.g.editorconfig = false -- Complete garbage as it loads all plugins .editorconfig ~/.local/share/nvim/lazy/*/.editorconfig

require("set_term_bg") -- https://github.com/neovim/neovim/issues/16572
require("lazy").setup("plugins")
-- require("mason").setup()
-- require("mason-lspconfig").setup{
--   ensure_installed = { "rust_analyzer", "clangd", "css_variables", "htmx"},
-- }

require("nvim-tree").setup{}

--vim.keymap.set("n", "gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>nornu', ':set number! norelativenumber<CR>')
vim.keymap.set('n', '<leader>rnu', ':set number! relativenumber<CR>')
vim.keymap.set('n', '<c-z>', '<nop>')
vim.opt.foldlevel = 9
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

