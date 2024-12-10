return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			'hrsh7th/nvim-cmp',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
		}
	},
	config = function()
		require "config.nvim-cmp"
		require "config.lsp"
	end
}
