vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>k", "<cmd>qa<cr>", { desc = "Quit all" })

-- navigation
vim.keymap.set({ "n", "i", "v" }, "<C-Up>", "<C-w>k", { desc = "Focus window above" })
vim.keymap.set({ "n", "i", "v" }, "<C-Down>", "<C-w>j", { desc = "Focus window below" })
vim.keymap.set({ "n", "i", "v" }, "<C-Left>", "<C-w>h", { desc = "Focus window to the left" })
vim.keymap.set({ "n", "i", "v" }, "<C-Right>", "<C-w>l", { desc = "Focus window to the right" })
