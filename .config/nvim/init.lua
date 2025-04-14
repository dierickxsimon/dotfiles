require("core.options")
require("core.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	require("plugins.neotree"), --for file tree on the left
	require("plugins.colortheme"), -- for nice colors
	require("plugins.bufferline"), -- for tabs on top of nvim and to switch betweeen tabs
	require("plugins.lualine"), -- the status bar in the footer of the IDE
	require("plugins.treesitter"), -- makes nice colors in the IDE
	require("plugins.telescope"), -- the telescope opens a modal to search in files/definitions/ect ...
	require("plugins.lsp"), -- language server to serve all different languages
	require("plugins.autocompletion"), -- autocomplete shit
	require("plugins.autoformatting"), -- auto format shit on save
	require("plugins.gitsigns"), --add git signs in file and everywhere else
	require("plugins.indent-blankline"), --ensure indents that are correct
	require("plugins.misc"), -- all small plugins that i don't know where to put``
})
