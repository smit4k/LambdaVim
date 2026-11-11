-- ~/.config/nvim/lua/config/diagnostics.lua
-- Only define diagnostic signs via the modern API
require("config.lazy")
-- global indentation settings (1 tab = 4 spaces)
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.autoindent = true

-- gutter / line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.fillchars:append({ eob = " " })

vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		if vim.bo.filetype:match("noice") or vim.bo.filetype:match("Telescope") then
			vim.wo.number = false
			vim.wo.relativenumber = false
			vim.wo.signcolumn = "no"
		end
	end,
})
