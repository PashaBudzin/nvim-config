local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>wm", function() harpoon:list():append() end)

vim.keymap.set("n", "<leader>wh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)
