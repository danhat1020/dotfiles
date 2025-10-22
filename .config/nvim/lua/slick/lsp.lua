-- LUA
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
vim.lsp.enable("lua_ls")
-- HTML
vim.lsp.enable("html")
-- TYPESCRIPT
vim.lsp.enable("ts_ls")
-- RUST
vim.lsp.enable("rust_analyzer")
-- CSS
vim.lsp.enable("cssls")
-- EMMET
vim.lsp.enable("emmet_language_server")
-- PRETTIER
vim.lsp.enable("prettierd")
-- C#
vim.lsp.enable("omnisharp")
-- QML
vim.lsp.enable("qmlls")
-- C/C++
vim.lsp.enable("clangd")
