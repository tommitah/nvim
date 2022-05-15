require('telescope').setup{
	defaults = {
		file_ignore_patterns = {"node_modules"}
	},
	extensions = {
		file_browser = {
			theme = "ivy",
		}
	},
}

require('telescope').load_extension 'file_browser'
