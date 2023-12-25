local wk = require('which-key')

wk.register({
	["<leader>n"] = "Nvim tree"
})

vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle)
