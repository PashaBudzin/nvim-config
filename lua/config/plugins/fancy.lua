return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			{
				"catpuccin/nvim",
				name = "catppuccin",
			},
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{ "nvim-tree/nvim-web-devicons", "catppuccin/nvim", opt = true },
	{
		"prichrd/netrw.nvim",
		opts = {
			-- Put your configuration here, or leave the object empty to take the default
			-- configuration.
			icons = {
				symlink = "", -- Symlink icon (directory and file)
				directory = "", -- Directory icon
				file = "", -- File icon
			},
			use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
			mappings = {}, -- Custom key mappings
		},
	},
}
