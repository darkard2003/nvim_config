return {
	'nvim-flutter/flutter-tools.nvim',
	lazy = true,
	ft = 'dart',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim', -- optional for vim.ui.select
		'mfussenegger/nvim-dap',
	},
	config = function()
		require("flutter-tools").setup {
			debugger = {
				enabled = true,
			}
		}
		vim.keymap.set('n', '<leader>fn', require('telescope').extensions.flutter.commands, { desc = "Load flutter tools" })
	end
}
