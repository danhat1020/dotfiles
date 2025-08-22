local lspconfig = require("lspconfig")
local on_attach = require("utils.lsp").on_attach

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
				},
			},
		},
	},
})

local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")

local prettier = require("efmls-configs.formatters.prettier")

lspconfig.efm.setup({
	on_attach = on_attach,
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"lua",
		"markdown",
		"typescript",
		"typescriptreact",
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	settings = {
		languages = {
			lua = { luacheck, stylua },
			html = { prettier },
			css = { prettier },
		},
	},
})

lspconfig.ts_ls.setup({ on_attach = on_attach })
lspconfig.glsl_analyzer.setup({ on_attach = on_attach })
lspconfig.rust_analyzer.setup({ on_attach = on_attach })
