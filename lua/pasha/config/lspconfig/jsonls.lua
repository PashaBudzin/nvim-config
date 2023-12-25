require("lspconfig").jsonls.setup {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- Schemas
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json"
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json"
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json"
					},
					url = "https://json.schemastore.org/prettierrc.json"
				},
				-- Add other schemas as needed
			}
		}
	}
}
