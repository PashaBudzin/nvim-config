-- configure cmp
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "copilot", group_index = 2 },
		{ name = "codeium", group_index = 2 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	experimental = {
		ghost_text = true,
	},
	-- formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<c-space>"] = cmp.mapping.complete(),
		["<tab>"] = cmp.mapping.confirm({ select = true }),
	}),

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	performance = {
		debounce = 0, -- default is 60ms
		throttle = 0, -- default is 30ms
		fetching_timeout = 500,
	},
})
