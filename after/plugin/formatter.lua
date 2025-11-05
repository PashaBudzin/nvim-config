local conform = require("conform")
local prettier = {
	"prettierd",
	"prettier",
}

conform.setup({
	lsp_fallback = true,
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = prettier,
		typescript = prettier,
		javascriptreact = prettier,
		typescriptreact = prettier,
		vue = prettier,
		json = prettier,
		svelte = prettier,
		html = prettier,
		css = prettier,
		scss = prettier,
		less = prettier,
		astro = prettier,
		go = { "goimports", "gofmt" },
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
		nix = { "nixfmt" },
		java = { "google-java-format" },
		kotlin = { "ktfmt" },
	},
	formatters = {
		prettier = {
			args = function(_, ctx)
				if vim.endswith(ctx.filename, ".astro") then
					return {
						"--stdin-filepath",
						"$FILENAME",
						"--plugin",
						"prettier-plugin-astro",
						"--plugin",
						"prettier-plugin-tailwindcss",
						"--print-width",
						"80",
					}
				end
				return {
					"--stdin-filepath",
					"$FILENAME",
					"--plugin",
					"prettier-plugin-tailwindcss",
					"--print-width",
					"80",
				}
			end,
			prepend_args = function()
				return {
					"--config-precedence",
					"prefer-file",
				}
			end,
		},
	},

	default_format_opts = {
		stop_after_first = true,
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
