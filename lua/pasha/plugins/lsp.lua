return {
	{"VonHeikemen/lsp-zero.nvim", dependencies = {
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},
		{'L3MON4D3/LuaSnip'},
		{'rafamadriz/friendly-snippets'},
		{'rcarriga/nvim-notify'},
		--rust tools
		{'simrat39/rust-tools.nvim', dependencies = {
			"folke/which-key.nvim"
			-- Tools for debugging
			-- 'nvim-lua/plenary.nvim',
			-- 'mfussenegger/nvim-dap'
		}}
	}},
}
