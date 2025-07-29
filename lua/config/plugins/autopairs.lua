return {
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes

		opts = {
			--Config goes here
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},

		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
}
