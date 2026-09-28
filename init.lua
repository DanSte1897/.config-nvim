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

vim.opt.clipboard = "unnamedplus"

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

    -- Difftool the + register with current buffer


    vim.api.nvim_create_user_command("DiffPlus", function()
        local current = vim.api.nvim_buf_get_name(0)

        if current == "" then
            vim.notify(
                "DiffPlus: current buffer has no filename; save it first.",
                vim.log.levels.ERROR
            )
            return
        end

        if vim.fn.executable("git") ~= 1 then
            vim.notify(
                "DiffPlus: git was not found in PATH.",
                vim.log.levels.ERROR
            )
            return
        end

        local lines = vim.fn.getreg("+", 1, true)

        vim.notify(("DiffPlus: got %d lines from + register"):format(#lines))

        local temp = vim.fn.tempname()

        local ok, err = pcall(vim.fn.writefile, lines, temp, "b")
        if not ok then
            vim.notify(
                "DiffPlus: couldn't write clipboard contents: " .. tostring(err),
                vim.log.levels.ERROR
            )
            return
        end

        local result = vim.system({
            "git", "difftool", "--no-prompt", "--no-index",
            current, temp,
        }, {
            text = true,
        }):wait()

        if result.code ~= 0 then
            vim.notify(
                ("DiffPlus: git difftool exited with code %d\n%s"):format(
                    result.code,
                    result.stderr or ""
                ),
                vim.log.levels.ERROR
            )
        end

        os.remove(temp)
    end, {})

    vim.keymap.set(
        "n",
        "<leader>+",
        "<cmd>DiffPlus<CR>",
        { desc = "Diff file with + register" }
    )
