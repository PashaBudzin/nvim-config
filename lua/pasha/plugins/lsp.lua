function configureLsp()
	local lsp = require("lsp-zero")

	require('mason').setup({
	})
	require('mason-lspconfig').setup({
		ensure_installed = {"lua_ls", "rust_analyzer"},
		handlers = {
			lsp.default_setup,
			rust_analyzer = function ()
				local rust_tools = require('rust-tools')

				rust_tools.setup({
					server = {
						on_attach =	function (_, bufnr)
							vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
						end 
					}
				})
			end
		},
	})
	lsp.preset("recommended")

	-- Fix Undefined global 'vim'
	local lua_opts = lsp.nvim_lua_ls()
	require('lspconfig').lua_ls.setup(lua_opts)


	local cmp = require('cmp')
	local cmp_action = require('lsp-zero').cmp_action()

	cmp.setup({
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-f>'] = cmp_action.luasnip_jump_forward(),
			['<C-b>'] = cmp_action.luasnip_jump_backward(),
			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-d>'] = cmp.mapping.scroll_docs(4),
			['<tab>'] = cmp.mapping.confirm({ select = true }),
		})
	})

	lsp.set_preferences({
		suggest_lsp_servers = false,
		sign_icons = {
			error = 'E',
			warn = 'W',
			hint = 'H',
			info = 'I'
		}
	})

	lsp.on_attach(function(client, bufnr)
		local opts = {buffer = bufnr, remap = false}

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

		vim.notify(string.format("Loaded %s", client.name))
	end)

	lsp.setup()

	vim.diagnostic.config({
		virtual_text = true,
		severity_sort = true
	})
end

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
