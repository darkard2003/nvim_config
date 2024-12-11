return {
	'nvim-flutter/flutter-tools.nvim',
	lazy = true,
	ft = 'dart',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim', -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup {}
		vim.keymap.set('n', '<leader>fn', require('telescope').extensions.flutter.commands, { desc = "Load flutter tools" })
		vim.keymap.set('n', '<leader>fm', require('telescope').extensions.flutter.fvm, { desc = "Load fvm tools" })
	end
}
