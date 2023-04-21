return {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    cmd = {"NvimTreeToggle", "NvimTreeClose"},
    config = function()
        require("opts.nvimtree").setup()
    end,
}