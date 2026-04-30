local conform = require("conform")
local prettier = {
	"prettierd",
	"prettier",
	"oxfmt",
	"oxlint",
}

local function has_oxfmt_config(bufnr)
	local bufpath = vim.api.nvim_buf_get_name(bufnr)
	if bufpath == "" then
		return false
	end

	local bufdir = vim.fn.fnamemodify(bufpath, ":h")
	local config_files = {
		".oxfmtrc.json",
		".oxfmtrc.jsonc",
		"oxfmt.config.ts",
		"oxfmt.config.js",
		"oxfmt.config.mjs",
		"oxfmt.config.cjs",
	}

	local dir = bufdir
	while dir and dir ~= "" and dir ~= "/" do
		for _, f in ipairs(config_files) do
			if vim.fn.filereadable(dir .. "/" .. f) == 1 then
				return true
			end
		end
		dir = vim.fn.fnamemodify(dir, ":h")
	end
	return false
end

local function js_formatter(bufnr)
	if has_oxfmt_config(bufnr) then
		return { "oxfmt", "oxlint" }
	end
	return prettier
end

conform.setup({
	lsp_fallback = true,
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = js_formatter,
		typescript = js_formatter,
		javascriptreact = js_formatter,
		typescriptreact = js_formatter,
		vue = js_formatter,
		json = js_formatter,
		svelte = js_formatter,
		html = js_formatter,
		css = js_formatter,
		scss = js_formatter,
		less = js_formatter,
		astro = js_formatter,
		go = { "goimports", "gofmt" },
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
		nix = { "nixfmt" },
		java = { "google-java-format" },
		kotlin = { "ktfmt" },
		python = { "ruff" },
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
