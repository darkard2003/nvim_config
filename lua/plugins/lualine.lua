return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local opts = require 'config.lualine.defaults'
		opts.options.theme = "catppuccin"
		require 'lualine'.setup(opts)
	end
}
