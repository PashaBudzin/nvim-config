print("hello, world")
require("avante").setup({
	provider = "gemini",
	input = {
		provider = "snacks",
		height = 100000,
		provider_opts = {
			title = "Avante Input",
			icon = " ",
		},
	},

	selector = {
		provider = "telescope",
	},
	behaviour = {
		auto_suggestions = false,
	},
})

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

require("copilot_cmp").setup()
