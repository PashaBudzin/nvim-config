local wk = require("which-key")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

wk.register({
	["<leader>"] = {
		u = "[U]ndo tree"
	}
})
