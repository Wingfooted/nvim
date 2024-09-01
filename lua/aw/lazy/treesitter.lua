return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {"r", "lua", "python", "sql"},
			sync_install = false,
			indent = {enable = true},
			hilight = {
				enable = true, 
				additional_vim_regex_highlighting = { "markdown" }
			},
		})

	end
}


