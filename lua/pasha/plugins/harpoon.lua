local function configureHarpoon()
	vim.keymap.set('n', '<leader>wm', require('harpoon.mark').add_file)
	vim.keymap.set('n', '<leader>wh', require('harpoon.ui').toggle_quick_menu)

	vim.keymap.set('n', '<leader>wj', function() require('harpoon.ui').nav_file(1) end)
	vim.keymap.set('n', '<leader>wk', function() require('harpoon.ui').nav_file(2) end)
	vim.keymap.set('n', '<leader>wl', function() require('harpoon.ui').nav_file(3) end)
	vim.keymap.set('n', '<leader>w;', function() require('harpoon.ui').nav_file(4) end)
end

return {
	{
		"theprimeagen/harpoon",
		event = "VeryLazy",
		config = configureHarpoon
	}
}
