local function configureBufferLine()
	require("bufferline").setup {
		highlights = require("catppuccin.groups.integrations.bufferline").get()
	}
end

return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = { 'catpuccin/nvim', 'nvim-tree/nvim-web-devicons' },
		config = configureBufferLine
	}
}
