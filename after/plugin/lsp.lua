local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function()
    	local bufmap = function (mode, lhs, rhs)
    		local opts = {buffer = true}
		vim.keymap.set(mode,lhs,rhs, opts)
	    end
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
end
})

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "rust_analyzer"}
})
require("mason-lspconfig").setup_handlers({
    function(server)
	lspconfig[server].setup({})
    end,
    ["rust_analyzer"] = function()
	require("rust-tools").setup()
    end,
    ["sumneko_lua"] = function()
	require("lspconfig")["sumneko_lua"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
end,

})

