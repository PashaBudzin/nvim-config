require("avante").setup({
	provider = "gemini",
	mode = "legacy",
	input = {
		provider = "dressing",
		provider_opts = {
			title = "Input",
			icon = " ",
		},
	},

	selector = {
		provider = "telescope",
	},
	behaviour = {
		auto_suggestions = false,
	},
	windows = {
		input = {
			height = 8,
		},
	},
})

-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false },
-- })
--
-- require("copilot_cmp").setup()
--
require("codeium").setup({})
