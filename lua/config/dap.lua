local dap = require 'dap'

--[[Setting the keymaps]]
vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "DAP Continue" })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "DAP Step Over" })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "DAP Step Into" })
vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "DAP Step Out" })
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end, { desc = "DAP Set Breakpoint" })
vim.keymap.set('n', '<Leader>lp',
	function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
	{ desc = "DAP Set Log Point" })
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = "DAP Open REPL" })
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = "DAP Run Last" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
	require('dap.ui.widgets').hover()
end, { desc = "DAP Hover" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
	require('dap.ui.widgets').preview()
end, { desc = "DAP Preview" })
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end, { desc = "DAP Frames" })
vim.keymap.set('n', '<Leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end, { desc = "DAP Scopes" })

--[[Setting background colors]]
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

--[[Setting dap icons]]
vim.fn.sign_define('DapBreakpoint',
	{ text = ' ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition',
	{ text = ' ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
	{ text = ' ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', {
	text = ' ',
	texthl = 'DapLogPoint',
	linehl = 'DapLogPoint',
	numhl =
	'DapLogPoint'
})
vim.fn.sign_define('DapStopped',
	{ text = ' ', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
