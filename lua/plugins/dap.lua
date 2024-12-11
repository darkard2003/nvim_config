return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			require 'config.dap'
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			local dapui = require('dapui')
			dapui.setup()
			vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = "Toggle DAP UI" })
		end
	},
	{
		'leoluz/nvim-dap-go',
		opts = {},
	}
}
