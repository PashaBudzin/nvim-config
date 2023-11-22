function colorMe()
	require("catppuccin").setup({
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
			telescope = {
				enabled = true
			}
		}
	})

	vim.cmd.colorscheme("catppuccin-mocha")
end

return {
	{ "catppuccin/nvim", config = colorMe }
}
