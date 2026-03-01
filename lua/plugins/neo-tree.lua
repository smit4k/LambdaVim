return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "Toggle Neo-tree",
		},
	},
	opts = {
		filesystem = {
			follow_current_file = true,
			use_libuv_file_watcher = true,
		},
		window = {
			position = "left",
			width = 35,
		},
		filesystem = {
			follow_current_file = true,
			use_libuv_file_watcher = true,
		},
	},
}
