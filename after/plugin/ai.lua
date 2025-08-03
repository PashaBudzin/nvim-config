require("avante").setup({
	provider = "gemini",
	providers = {},
	input = {
		provider = "snacks",
		provider_opts = {
			-- Additional snacks.input options
			title = "Avante Input",
			icon = " ",
		},
	},

	selector = {
		provider = "telescope",
	},
})
