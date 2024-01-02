require("lspconfig").jsonls.setup {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- Schemas
			schemas = {
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml"] = "/*"
			}
		}
	}
}
