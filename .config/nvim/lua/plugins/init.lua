return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = require "configs.mason",
    dependencies = {
      { "mason-org/mason.nvim", opts = require "configs.mason" },
      {
        "neovim/nvim-lspconfig",
        config = function()
          require "configs.lspconfig"
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = require "configs.gopher",
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    opts = {},
  },
  { import = "nvchad.blink.lazyspec" },
  {
    "saghen/blink.cmp",
    enabled = true,
    lazy = false,
    build = "cargo +nightly build --release",
    opts = require "configs.blink",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vim", "lua", "vimdoc", "html", "css", "go", "cpp", "c" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      require("harpoon"):setup()
    end,
  },
  {
    "ej-shafran/compile-mode.nvim",
    lazy = false,
    -- you can just use the latest version:
    -- branch = "latest",
    -- or the most up-to-date updates:
    -- branch = "nightly",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- if you want to enable coloring of ANSI escape codes in
      -- compilation output, add:
      -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        -- to add ANSI escape code support, add:
        -- baleia_setup = true,
      }
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup {
        view_options = {
          show_hidden = true,
        },
      }
    end,
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  { "stevearc/vim-arduino", lazy = false },
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      -- check the installation instructions at
      -- https://github.com/folke/snacks.nvim
      "folke/snacks.nvim",
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
        change_working_directory = "<c-\\>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
