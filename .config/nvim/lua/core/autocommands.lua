vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("UserConfig", {}),
    callback = function()
        vim.highlight.on_yank()
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({
            filter = function(client)
                if client.name == "eslint" then
                    return true
                end
                return client.name ~= "eslint"
            end,
            async = false,
        })
    end,
})
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")
