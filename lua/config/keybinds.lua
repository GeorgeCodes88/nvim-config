vim.g.mapleader = " "

-- Use <space>cd to open the file explorer (Netrw)
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Moving through files
vim.keymap.set("n", "<Tab>", ":n<CR>")      -- Next file
vim.keymap.set("n", "<S-Tab>", ":prev<CR>") -- Previous file (Shift+Tab)

