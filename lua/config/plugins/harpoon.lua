return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		vim.keymap.set("n", "<leader>hm", function()
			require("harpoon.ui").toggle_quick_menu()
		end, { desc = "Harpoon open quick menu" })

		vim.keymap.set("n", "<leader>ha", function()
			require("harpoon.mark").add_file()
		end, { desc = "Harpoon add mark" })

		vim.keymap.set("n", "<leader>1", function()
			require("harpoon.ui").nav_file(1)
		end, { desc = "Harpoon nav file 1" })

		vim.keymap.set("n", "<leader>2", function()
			require("harpoon.ui").nav_file(2)
		end, { desc = "Harpoon nav file 2" })

		vim.keymap.set("n", "<leader>3", function()
			require("harpoon.ui").nav_file(3)
		end, { desc = "Harpoon nav file 3" })

		vim.keymap.set("n", "<leader>4", function()
			require("harpoon.ui").nav_file(4)
		end, { desc = "Harpoon nav file 4" })

		vim.keymap.set("n", "<leader>5", function()
			require("harpoon.ui").nav_file(5)
		end, { desc = "Harpoon nav file 5" })
	end,
}
