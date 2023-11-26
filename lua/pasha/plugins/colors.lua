local function setCatppuccin()
	vim.cmd.colorscheme("catppuccin")
	vim.api.nvim_set_hl(0, '@lsp.type.function', {})

	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
		vim.api.nvim_set_hl(0, group, {})
	end
end

return {
	{
		"catppuccin/nvim",
		config = setCatppuccin,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = false,
			term_colors = true,
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
				},
			},
		}
	}
}
