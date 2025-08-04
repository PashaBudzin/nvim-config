require("lspconfig")

-- configure cmp
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "copilot", group_index = 2 },
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
})

-- on attach
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP keymaps and commands",
	callback = function(event)
		local bufnr = event.buf
		local opts = function(desc)
			return { buffer = bufnr, remap = false, desc = desc }
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts("Open diagnostic float"))
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts("Search workspace symbols"))
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts("Open diagnostic float"))
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts("Next diagnostic"))
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts("Previous diagnostic"))
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts("Code action"))
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts("Show references"))
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts("Rename symbol"))
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts("Signature help"))

		vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format current buffer with LSP" })

		vim.keymap.set("n", "<leader>i", vim.cmd.Format, opts("Format buffer"))
	end,
})
