local actions = require "telescope.actions"
local telescope = require('telescope')
telescope.load_extension('media_files')
telescope.load_extension('harpoon')

telescope.setup{
    defaults = {
	prompt_prefix = " ",
	selection_caret = " ",
	path_display = { "smart" },
	file_ignore_patterns = {".*_virt/.*", "*env*", "*undo*"},
	mappings = {
	    n = {
		["q"] = actions.close,
	    },

	    i = {
		["<C-h>"] = "which_key",
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	    }
	}
    },
    pickers = {
	-- Default configuration for builtin pickers goes here:
	-- picker_name = {
	--   picker_config_key = value,
	--   ...
	-- }
    },
    extensions = {
	fzf = {
	    fuzzy = true,                    -- false will only do exact matching
	    override_generic_sorter = true,  -- override the generic sorter
	    override_file_sorter = true,     -- override the file sorter
	    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
	}
    }
}