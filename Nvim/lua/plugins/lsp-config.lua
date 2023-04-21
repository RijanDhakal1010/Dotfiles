return{
"neovim/nvim-lspconfig",
config = function()
	require("opts.lsp_keymaps")
end,
dependencies = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("opts.mason_lspconfig").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
},
  
}