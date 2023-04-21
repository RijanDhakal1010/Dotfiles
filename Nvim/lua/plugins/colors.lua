return {
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("opts.gruvbox").setup()
		end,
	},
	{
		"catppuccin/nvim",
		--lazy = true,
		name = "catppuccin",
	},
}