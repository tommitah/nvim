require('telescope').setup{
	defaults = {
		file_ignore_patterns = {"node_modules", "target"},
		theme = "ivy",
	},
	extensions = {
		file_browser = {
			theme = "ivy",
		},
		cder = {
			dir_command = { 'fd', '--hidden', '--type=d', '.', os.getenv('HOME') },
			previewer_command = "exa --color=always -a --icons",
			-- theme = "ivy",
			pager_command = 'bat --plain --paging=always --pager="less -RS"',
		}
	},
}

require('telescope').load_extension 'file_browser'
require('telescope').load_extension('cder')
