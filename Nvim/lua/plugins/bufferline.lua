return{
    "akinsho/nvim-bufferline.lua",
	config = function()
		require("opts.bufferline").setup()
	end,
	event = "BufReadPre",
	dependencies = {
		"nvim-web-devicons",
	},
}