local ok, cmp = pcall(require, "cmp")
if not ok then
    return
end

cmp.setup({
    snippet = {
	expand = function(args)
	    require("luasnip").lsp_expand(args.body)
	end,
    },
    sources = {
	{ name = "nvim_lsp" },
	{ name = "luasnip" },
    },
    mapping = {
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
		    fallback()
		end
	end, { "i" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
		    fallback()
		end
	end, { "i" }),

	["<CR>"] = cmp.mapping.confirm({select = true}),

    },
})


