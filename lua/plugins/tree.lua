local tree = require("nvim-tree")

tree.setup({
	reload_on_bufenter = true,
	view = {
		width = 45,
	},
	filters = {
		dotfiles = true,
	},
})
