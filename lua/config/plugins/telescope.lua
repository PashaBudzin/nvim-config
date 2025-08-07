return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-tree/nvim-web-devicons", "catppuccin/nvim", opt = true },
		},

		init = function()
			local builtin = require("telescope.builtin")

			require("telescope").load_extension("fzf")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<c-p>", builtin.git_files, { desc = "Telescope help tags" })

			-- vim.keymap.set("n", "<leader><leader>", builtin.git_files, { desc = "Telescope " })
		end,
	},
}
