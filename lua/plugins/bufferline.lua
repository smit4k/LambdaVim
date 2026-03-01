-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{
			"<leader>br",
			"<Cmd>BufferLineCloseRight<CR>",
			desc = "Delete Buffers to the Right",
		},
		{
			"<leader>bl",
			"<Cmd>BufferLineCloseLeft<CR>",
			desc = "Delete Buffers to the Left",
		},
		{ "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
		{ "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
		{ "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
		{ "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
		{ "[B", "<Cmd>BufferLineMovePrev<CR>", desc = "Move Buffer Prev" },
		{ "]B", "<Cmd>BufferLineMoveNext<CR>", desc = "Move Buffer Next" },
	},
	opts = {
		options = {
			close_command = "bdelete! %d",
			right_mouse_command = "bdelete! %d",
			diagnostics = false, -- Bufferline won't handle diagnostics
			always_show_bufferline = true,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
			get_element_icon = function(opts)
				local icons = {
					lua = "",
					python = "",
					javascript = "",
					typescript = "",
					html = "",
					css = "",
					default = "",
				}
				return icons[opts.filetype] or icons.default
			end,
		},
	},
	config = function(_, opts)
		-- Modern diagnostic configuration
		local diag_icons = { Error = "", Warn = "", Info = "", Hint = "" }

		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = diag_icons.Error },
					{ name = "DiagnosticSignWarn", text = diag_icons.Warn },
					{ name = "DiagnosticSignInfo", text = diag_icons.Info },
					{ name = "DiagnosticSignHint", text = diag_icons.Hint },
				},
			},
			update_in_insert = true, -- replaces deprecated diagnostics_update_in_insert
			severity_sort = true,
		})

		-- Optional: highlight colors
		vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff0000" })
		vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffaa00" })
		vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#00aaff" })
		vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#aaaaaa" })

		-- Setup bufferline
		require("bufferline").setup(opts)

		-- Refresh bufferline when buffers are added or deleted
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					pcall(function()
						require("bufferline").setup(opts)
					end)
				end)
			end,
		})
	end,
}
