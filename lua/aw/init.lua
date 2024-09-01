
require("aw.options")
require("aw.remap")
require("aw.magma")

-- Lazy Loading
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    spec = "aw.lazy",
    change_detection = { notify = false }
})

--Colorscheme
require("monet").setup {
	transparent_background = true,
	semantic_tokens = true,
	dark_mode = true,
	highlight_overrides= {},
	color_overrides = {},
	styles = {}
}
vim.cmd.colorscheme 'monet'


