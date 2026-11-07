return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",

			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "󰒓",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "󰜰",
				Module = "󰚩",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "󰘵",
				Keyword = "󰌋",
				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "󰘵",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "󰄉",
				Operator = "󰆕",
				TypeParameter = "",
			},
		},

		completion = {
			menu = {
				border = "rounded",
				scrollbar = true,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel",
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},
		},

		signature = {
			enabled = true,
			window = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		},
	},
}
