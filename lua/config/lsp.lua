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




vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end
		if client.supports_method('textDocument/rename') then
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
		end
		if client.supports_method('textDocument/implementation') then
			vim.keymap.set('n', '<leader>ri', vim.lsp.buf.implementation)
		end
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end
			})
		end
	end,
})
