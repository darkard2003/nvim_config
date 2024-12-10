local km = vim.keymap.set
km("i", "jk", "<esc>", { desc = "jk to esc" })

vim.g.mapleader = " "

km("n", "<leader><leader>x", ":source %<CR>", { desc = "source the current file" })
km("n", "<leader>x", ":.lua<CR>", { desc = "source the current line" })

km("n", "<C-h>", "<C-w><C-h>", { desc = "Better left movement" })
km("n", "<C-j>", "<C-w><C-j>", { desc = "Better down movement" })
km("n", "<C-k>", "<C-w><C-k>", { desc = "Better up movement" })
km("n", "<C-l>", "<C-w><C-l>", { desc = "Better right movement" })
