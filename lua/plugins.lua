-- Bootstrapping packer
-- Ref: https://github.com/wbthomason/packer.nvim/blob/c662294/README.md#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1", "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

-- Returns the require for use in `config` parameter of packer"s use
-- Expects the name of the config file
-- Load config for other plugins
local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- Initialize and configure packer
local packer = require("packer")

-- Ref: https://github.com/wbthomason/packer.nvim/blob/c662294/README.md#custom-initialization
packer.init({
  -- Use :PackerProfile to see the result
  -- Ref: https://github.com/wbthomason/packer.nvim/blob/c662294/README.md#profiling
  profile = {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- configs are available in .config/nvim/lua/config
packer.startup(function(use)
  use({
    "metalelf0/jellybeans-nvim",
    requires = {
      "rktjmp/lush.nvim", -- helpers
    },
    config = get_config("jellybeans-nvim"),
  })

  -- Various small plugins
  use({
    "echasnovski/mini.nvim",
    branch = "stable",
    config = get_config("mini"),
  })

  -- Movements
  use({
    "justinmk/vim-sneak",
    config = get_config("vim-sneak"),
  })

  -- File explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    config = get_config("nvim-tree"),
  })

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = get_config("lualine"),
  }

  -- File navigation
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = get_config("telescope"),
  })

  -- Better highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  })

  -- Manage keys
  use({ "folke/which-key.nvim", config = get_config("which-key") })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    config = get_config("toggleterm"),
  })

  -- packer plugin itself
  use("wbthomason/packer.nvim")

  -- Fancy notification
  use({ "rcarriga/nvim-notify", config = get_config("notify") })

  -- Git
  use({
    "tpope/vim-fugitive",
    requires = { {
      "shumphrey/fugitive-gitlab.vim",
      "tpope/vim-rhubarb",
    } },
  })

  -- Tabs
  use({ "nanozuki/tabby.nvim", config = get_config("tabby") })

  -- Better surround plugin
  use({ "tpope/vim-surround" })

  -- NOT WORKING
  use({ "simrat39/symbols-outline.nvim", config = get_config("symbols-outline") })

  -- Test
  use({ "vim-test/vim-test", config = get_config("vim-test") })

  -- tmux + neovim navigation
  use({ "alexghergh/nvim-tmux-navigation" })

  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = get_config("lsp-zero"),
  })

  -- Show git changes
  use({ "lewis6991/gitsigns.nvim", config = get_config("gitsigns") })

  -- Proper support for ruby blocks completion
  use({ "tpope/vim-endwise" })

  -- OneDarkPro theme
  use({ "olimorris/onedarkpro.nvim", config = get_config("onedarkpro") })

  -- Highlight matching if/def/etc
  use({ "andymass/vim-matchup", config = get_config("vim-matchup") })

  -- coffeescript
  use({ "kchmck/vim-coffee-script" })

  -- copilot
  use({
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = get_config("copilot"),
  })

  -- Used for bootstrapping
  if packer_bootstrap then
    require("packer").sync()
  end
end)
