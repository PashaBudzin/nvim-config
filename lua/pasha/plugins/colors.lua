local function colorMe()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = false,
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
		},
	})

	vim.cmd.colorscheme("catppuccin")
end

return {
	{ "catppuccin/nvim", config = colorMe, name = "catppuccin", priority = 1000 }
}
