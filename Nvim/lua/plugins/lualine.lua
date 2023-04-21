return {
    "nvim-lualine/lualine.nvim",
	config = function()
		require('lualine').setup()
		options = { theme = "gruvbox" }
	end,
	dependencies = {
		{
			'kyazdani42/nvim-web-devicons',
			lazy = true
		},
	},
}