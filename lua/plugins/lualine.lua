return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				theme = "auto", -- automatically matches colorscheme
				globalstatus = true, -- one statusline for all windows
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter" },
				},
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
					},
				},

				lualine_b = {
					{
						"branch",
						icon = "",
					},
					"diff",
				},

				lualine_c = {
					{
						"filename",
						path = 1, -- 0 = just filename, 1 = relative path
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = " [No Name]",
						},
					},
				},

				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
					},
					{
						function()
							local msg = "No Active Lsp"
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.tbl_contains(filetypes, buf_ft) then
									return "  " .. client.name
								end
							end
							return msg
						end,
						icon = "",
					},
					"encoding",
					"fileformat",
					"filetype",
				},

				lualine_y = { "progress" },
				lualine_z = { "location" },
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},

			extensions = {
				"nvim-tree",
				"lazy",
				"mason",
				"quickfix",
			},
		})
	end,
}
