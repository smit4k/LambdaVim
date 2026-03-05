return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			highlight = "IblScope",
		},
	},
	config = function(_, opts)
		local hooks = require("ibl.hooks")

		-- highlight for the active indent scope
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7", bold = true })

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7", bold = true })
		end)

		require("ibl").setup(opts)

		-- toggle keymap
		vim.keymap.set("n", "<leader>ug", function()
			local config = require("ibl.config").get_config(0)
			require("ibl").setup_buffer(0, { enabled = not config.enabled })
		end, { desc = "Toggle Indent Guides" })
	end,
}
