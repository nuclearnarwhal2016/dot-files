local ok, luasnip = pcall(require, "luasnip")
if not ok then
	return
end

luasnip.config.set_config({
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",

})

local imap = require("keymap").imap
local smap = require("keymap").smap

-- expand or jump in insert mode
imap("<Tab>", "luasnip#expand_or_jumpable()? '<Plug>luasnip-expand-or-jump':'<Tab>'", {expr = true, silent = true})

-- jump forward through tabstops in visual mode
smap("<Tab>", "luasnip#jumpable(1)? '<Plug>luasnip-jump-next': '<Tab>'", {expr = true, silent = true})

-- jump backward through snippet tabstops
imap("<S-Tab>", "luasnip#jumpable(-1)? '<Plug>luasnip-jump-prev':'<S-Tab>'", {expr = true, silent = true})
smap("<S-Tab>", "luasnip#jumpable(-1)? '<Plug>luasnip-jump-prev': '<S-Tab>'", {expr = true, silent = true})


