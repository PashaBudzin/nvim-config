require("lspconfig").jsonls.setup {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- Schemas
			schemas = require("schemastore").json.schemas()
		}
	}
}
