local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = {},

  -- Icons
  ["kyazdani42/nvim-web-devicons"] = {},

  -- Themes
  ["Mofiqul/vscode.nvim"] = {
    config = function() require("configs.themes.vscode") end
  },
  -- ["morhetz/gruvbox"] = {
  --   config = function() require("configs.themes.gruvbox") end
  -- },

  -- Files
  ["kyazdani42/nvim-tree.lua"] = {
    config = function() require("configs.nvim-tree") end
  },

  -- Line
  ["nvim-lualine/lualine.nvim"] = {
    config = function() require("configs.lualine") end
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function() require("configs.treesitter") end,
  },

  ["akinsho/bufferline.nvim"] = {
    config = function() require("configs.bufferline") end,
  },
  ["romgrk/barbar.nvim"] = {},

  -- Telescope
  ["nvim-telescope/telescope.nvim"] = {
    config = function() require("configs.telescope") end,
	},

  -- Terminal
  ["akinsho/toggleterm.nvim"] = {
    config = function() require("configs.toggleterm") end,
  },

  ["glepnir/dashboard-nvim"] = {
    config = function() require("configs.dashboard-nvim") end,
  },

  -- Git
  ["lewis6991/gitsigns.nvim"] = {
    config = function() require("configs.gitsigns") end,
  },

  -- LSP
  ["williamboman/nvim-lsp-installer"] = {},
  ["neovim/nvim-lspconfig"] = {},

  -- cmp plugins
  ["hrsh7th/nvim-cmp"] = {},
  ["hrsh7th/cmp-buffer"] = {},
  ["hrsh7th/cmp-path"] = {},
  ["hrsh7th/cmp-cmdline"] = {},
  ["hrsh7th/cmp-nvim-lsp"] = {},

  ["L3MON4D3/LuaSnip"] = {},
  ["rafamadriz/friendly-snippets"] = {},
  ["onsails/lspkind-nvim"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function() require("null-ls") end,
  }
}

local status_ok, packer = pcall(require, "packer")

if not status_ok
then
  local fn = vim.fn

  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    ---@diagnostic disable-next-line: lowercase-global
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
  end
  vim.cmd [[packadd packer.nvim]]
end

packer.init {
	display = {
		opt_default = true,
		open_fn = require("packer.util").float, -- An optional function to open a window for packer's display
		working_sym = "🛠",                     -- The symbol for a plugin being installed/updated
		error_sym = "🧨",                       -- The symbol for a plugin with an error in installation/updating
		done_sym = "🎉",                        -- The symbol for a plugin which has completed installation/updating
		removed_sym = "🔥",                     -- The symbol for an unused plugin which was removed
		moved_sym = "🚀",                       -- The symbol for a plugin which was moved (e.g. from opt to start)
		header_sym = "━",                       -- The symbol for the header line in packer's display show_all_info = true, -- Should packer show all update details automatically?
		prompt_border = "double",               -- Border style of prompt popups.
	},
}

packer.reset()

packer.startup(function(use)
  for key, plugin in pairs(plugins)
  do
    table.insert(plugin, 1, key)
    use(plugin)
  end
end)
