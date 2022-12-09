-- Install packer if not installed
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

-- installs packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.cmd([[packadd packer.nvim]])
end

-- using Packer as plugin manager
require("packer").startup(function(use)
    -- Packer
    use({"wbthomason/packer.nvim"})
    -- Telescope
    use({"nvim-telescope/telescope.nvim",
	requires = {
	    "nvim-lua/popup.nvim",
	    "nvim-lua/plenary.nvim",
	},
    })
    -- treesitter
    use({"nvim-treesitter/nvim-treesitter"})


    -- Colorscheme
    use({"catppuccin/nvim", as = "catppuccin"})
    -- LSP
    use({"neovim/nvim-lspconfig",
	requires = {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "jose-elias-alvarez/null-ls.nvim",
	}
    })
    -- completion
    use({"hrsh7th/nvim-cmp",
	requires = {
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-path",
	    "saadparwaiz1/cmp_luasnip",
	    "L3MON4D3/LuaSnip",
	    "rafamadriz/friendly-snippets",
	}
    })
    -- rust
    use({"simrat39/rust-tools.nvim"})

    -- ui nicer
    use({"stevearc/dressing.nvim"})

    -- running code
    use({"stevearc/overseer.nvim"})

    -- notify
    use({"rcarriga/nvim-notify"})

    -- status line
    use({"nvim-lualine/lualine.nvim",
	requires = {
	    'kyazdani42/nvim-web-devicons', opt = true
	}
    })

    if is_bootstrap then
	require("packer").sync()
    end
end)
