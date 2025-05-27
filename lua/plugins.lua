return
{
-- { "catppuccin/nvim", name = "catppuccin", priority = 1000},
  {
--   "folke/tokyonight.nvim",
--   name = "tokyonight",
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    name="cyberdream",
    priority = 1000,
    config = function()
      require("cyberdream").setup({
	    })
        vim.cmd("colorscheme cyberdream")
    end,
  },
--  {
--     "folke/neoconf.nvim",
--      cmd = "Neoconf"
--  },
  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {"nvim-tree/nvim-web-devicons",},
  config = function()
    require("nvim-tree").setup {}
  end,
  },
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts =
    {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(opts)
      require("lualine").setup
      { 
        options = 
        { 
          theme = 'auto',
          section_separators = '',
          component_separators = '',
        },
        -- sections =
        -- {
        --   lualine_a = {'mode'},
        --   lualine_b = {'branch', 'diff', 'diagnostics'},
        --   lualine_c = {'filename'},
        --   lualine_x = {'filetype'},
        --   lualine_y = {'progress'},
        --   lualine_z = {'location'}
        -- },
      }
    end,
  },
}

