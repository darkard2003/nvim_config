local opts = {
  expandtab = true,
  number = true,
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  smarttab = true,
  splitright = true,
  splitbelow = true,
  foldlevel = 99,
  list = true,
  listchars = { tab = '▸ ', trail = '·', extends = '>', precedes = '<', space = '·' },
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
