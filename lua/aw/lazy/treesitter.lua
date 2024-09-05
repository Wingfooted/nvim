return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- https://www.reddit.com/r/neovim/comments/t1zsg2/what_is_ensured_installed_option_do_on/
			-- above is a partial list
			ensure_installed = {
				"python", "sql", -- core
				"lua", -- nvim config
				-- "r", "markdown", "rnoweb", "yaml", "markdown_inline", -- r coding
				"html", "javascript", "css" -- web dev
			},
			sync_install = false,
			indent = {enable = true},
			hilight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" }
			},
		})

	end
}


