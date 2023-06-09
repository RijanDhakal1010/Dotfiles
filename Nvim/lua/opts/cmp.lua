local M = {}

function M.setup()

	local cmp = require "cmp" -- not sure why but this is how cmp needs its settings to be passed.

	cmp.setup{
		mapping = {
			["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
			["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<c-y>"] = cmp.mapping(
				cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				},
				{"i","c"}
			),
			["<M-y>"] = cmp.mapping(
				cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				{"i","c"}
			),

			["<c-space>"] = cmp.mapping {
				i = cmp.mapping.complete(),
				c = function(
					_ --[[fallback]]
				)
				-- not sure why this chuck was extra indented #TODO
					if cmp.visible() then
						if not cmp.confirm { select = true } then
							return
						end
					else 
						cmp.complete()
					end
				end,
			},

			["<tab>"] = cmp.config.disable,

			["<c-q>"] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
		},

		sources = {
			{name = "buffer", keyword_length = 5},
			{name = "path"},
			{name = "nvim_lsp"},
			{name = "nvim_lua"},
			{name = "luasnip"},
		},

		sorting = {
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,

				function (entry1, entry2)
					local _, entry1_under = entry1.completion_item.label:find "^_+"
					local _, entry2_under = entry2.completion_item.label:find "^_+"
					entry1_under = entry1_under or 0
					entry2_under = entry2_under or 0
					if entry1_under > entry2_under then
						return false
					elseif entry1_under < entry2_under then
						return true
					end
				end,

				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		--formatting = {
		--	format = lspkind.cmp_format {
		--		with_text = true,
		--		menu = {
		--			buffer = "[buf]",
		--			nvim_lsp = "[LSP]",
		--			nvim_lua = "[api]",
		--			path = "[path]",
		--			luasnip = "[snip]",
		--		},
		--	},
		--},

	}
end

return M
