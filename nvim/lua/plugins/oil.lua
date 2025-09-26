-- File explorer that lets you edit your filesystem like a buffer
return {
	"stevearc/oil.nvim",
	opts = {
		-- Oil will take over directory buffers (e.g. `nvim .` or `:e src/`)
		default_file_explorer = true,
		-- Columns to show in oil buffer
		columns = {
			"icon",
			"permissions",
			"size",
		},
		-- Buffer-local options to use for oil buffers
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		-- Window-local options to use for oil buffers
		win_options = {
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
		},
		-- Send deleted files to the trash instead of permanently deleting them
		delete_to_trash = true,
		-- Skip the confirmation popup for simple operations
		skip_confirm_for_simple_edits = false,
		-- Show hidden files
		show_hidden = false,
		-- Set to true to watch the filesystem for changes and reload oil
		watch_for_changes = false,
		-- Keymaps in oil buffer
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = "actions.select_vsplit",
			["<C-h>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}