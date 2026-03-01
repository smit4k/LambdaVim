-- ~/.config/nvim/lua/plugins/conform.lua
return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			lua = {
				exe = "stylua",
				args = { "--indent-width", "2", "--line-endings", "Unix", "-" },
				stdin = true,
			},
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			python = { "black" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
		},

		-- Autoformat on save
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
			stop_after_first = true, -- NEW: replace the nested {} syntax
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				conform.format({ lsp_fallback = true })
			end,
		})

		vim.keymap.set("n", "<leader>f", function()
			conform.format({ lsp_fallback = true })
		end, { desc = "Format buffer" })
	end,
}
