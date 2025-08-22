_G.custom_tabline = function()
    local line = ""
    for i = 1, vim.fn.tabpagenr("$") do
        local winnr = vim.fn.tabpagewinnr(i)
        local buflist = vim.fn.tabpagebuflist(i)
        local bufnr = buflist[winnr]

        local bufname = ""
        if bufnr and vim.fn.buflisted(bufnr) == 1 then
            bufname = vim.fn.bufname(bufnr) or ""
        end

        local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"

        if i == vim.fn.tabpagenr() then
            line = line .. "%#TabLineSel# " .. filename .. " %#TabLine#"
        else
            line = line .. "%#TabLine# " .. filename .. " "
        end
    end
    return line .. "%#TabLineFill#"
end

vim.opt.tabline = "%!v:lua.custom_tabline()"
vim.opt.showtabline = 2
vim.cmd("highlight TabLineSel guibg=#282828 guifg=#c0c0c0 gui=bold")
vim.cmd("highlight TabLine guibg=#141414 guifg=#808080")
vim.cmd("highlight TabLineFill guibg=none")
