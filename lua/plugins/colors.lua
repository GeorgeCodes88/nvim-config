local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "hrsh7th/cmp-nvim-lsp",
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "catppuccin",
	}
    }
}
