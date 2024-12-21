local lsp_zero = require("lsp-zero")
local conform = require("conform")

local prettier = {
    { "prettierd", "prettier" },
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
                    }
                end
                return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-tailwindcss" }
            end,
        },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format current buffer with LSP" })

    vim.keymap.set("n", "<leader>i", vim.cmd.Format)
end)

vim.g.rustaceanvim = {
    server = {
        capabilities = lsp_zero.get_capabilities(),
    },
}

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "rust_analyzer", "lua_ls", "jsonls", "yamlls", "eslint" },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
        rust_analyzer = lsp_zero.noop,
    },
})

require("lspconfig").jsonls.setup({
    filetypes = { "json", "jsonc" },
    settings = {
        json = {
            -- Schemas
            schemas = require("schemastore").json.schemas(),
        },
    },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer",  keyword_length = 3 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<c-space>"] = cmp.mapping.complete(),
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
    }),
})
