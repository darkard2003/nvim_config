local opts = {
	number = true,
	relativenumber = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	smarttab = true,
	autoindent = true,
	splitright = true,
	splitbelow = true,
	foldlevel = 99,
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end
