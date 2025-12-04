return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"tribela/transparent.nvim",
		event = "VimEnter",
		config = true,
	},
}
