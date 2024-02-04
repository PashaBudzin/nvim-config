local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        e = "open diagnostics",
        v = {
            name = "lsp actions",
            c = {
                name = "actions",
                a = "code actions"
            },
            r = {
                name = "references",
                n = "rename",
                r = "find references"
            },
            w = {
                name = "query",

            }
        },
    },
    ["g"] = {
        d = "[G]o to [D]efinitions"
    },
})
