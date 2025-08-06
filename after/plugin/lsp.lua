require("lspconfig")

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
