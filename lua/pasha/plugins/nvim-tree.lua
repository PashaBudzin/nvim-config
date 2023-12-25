return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	event = "VeryLazy",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
			disable_netrw = false,
			hijack_netrw = false,
			auto_close = true,
		}
	end,
}

