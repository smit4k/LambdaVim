-- ~/.config/nvim/lua/plugins/dropbar.lua
return {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local dropbar_api = require("dropbar.api")

		-- Keymaps
		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
		vim.keymap.set(
			"n",
			"[;",
			dropbar_api.goto_context_start,
			{ desc = "Go to start of current context" }
		)
		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })

		-- Fix gutter (line numbers) globally
		vim.api.nvim_create_autocmd("BufWinEnter", {
			pattern = "*",
			callback = function()
				local ft = vim.bo.filetype
				if ft ~= "neo-tree" and ft ~= "TelescopePrompt" and ft ~= "dropbar" and not ft:match("noice") then
					vim.wo.number = true
					vim.wo.relativenumber = true
					vim.wo.signcolumn = "yes"
				end
			end,
		})
	end,
}
