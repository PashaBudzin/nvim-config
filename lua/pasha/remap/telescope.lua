local wk = require("which-key")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

wk.register({
	["<leader>"] = {
		f = {
			name = "Telescope [F]ind",
			f =	"[F]ind [F]iles",
			h = "[F]ind [H]elp tags",
			b = "[F]ind [B]uffers",
			g = "Live [G]rep",
			r = "[F]ind [R]eferences"
		},
		p = {
			s = "Grep string"
		}
	},
})
