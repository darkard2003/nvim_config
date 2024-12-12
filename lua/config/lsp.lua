local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('mason').setup()

local mason_lsp = require 'mason-lspconfig'
mason_lsp.setup({
	ensure_installed = { "lua_ls" }
})

local lspconfig = require 'lspconfig'
local capabilites = require('cmp_nvim_lsp').capabilites

mason_lsp.setup_handlers {
	function(server_name)
		if server_name == 'lua_ls' then
			lspconfig.lua_ls.setup {
				capabilites = capabilites,
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
							return
						end
					end
					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							version = 'LuaJIT'
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
							}
						}
					})
				end,
				settings = {
					Lua = {}
				}
			}
		else
			lspconfig[server_name].setup {
				capabilites = capabilites,
			}
		end
	end
}



local lsp_method_map = {
	{
		name = 'textDocument/rename',
		keymap = '<leader>rn',
		action = vim.lsp.buf.rename,
	},
	{
		name = 'textDocument/implementation',
		keymap = 'gi',
		action = vim.lsp.buf.implementation,
	},
	{
		name = 'textDocument/codeAction',
		keymap = '<leader>ca',
		action = vim.lsp.buf.code_action,
	},
	{
		name = 'textDocument/formatting',
		keymap = '<leader>fm',
		action = vim.lsp.buf.format,
	},
	{
		name = 'textDocument/definition',
		keymap = 'gd',
		action = vim.lsp.buf.definition
	}
}

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end
		for _, v in ipairs(lsp_method_map) do
			if client.supports_method(v.name) then
				vim.keymap.set('n', v.keymap, v.action)
				if v.name == 'textDocument/formatting' then
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end
					})
				end
			end
		end
	end,
})
