local wk = require("which-key")

vim.keymap.set('n', '<leader>wn', function()
	vim.cmd('bnext')
end)

vim.keymap.set('n', '<leader>wp', function()
	vim.cmd('bprevious')
end)

wk.register({
	['<leader>'] = {
		w = {
			name = 'navigation',
			n = "[Buffer] next",
			p = "[Buffer] prev",
			h = "[H]arpoon quick menu",
			j = "harpoon 1 file",
			k = "harpoon 2 file",
			l = "harpoon 3 file",
			[';'] = "harpoon 4 file",
		}
	}
})
