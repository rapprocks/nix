-- telescope.lua
--
return {
	require('telescope').setup {


		defaults = {


			selection_caret = '➜ ',
			prompt_prefix = ' ➜ ',


			border = {
				prompt = { 1, 1, 1, 1 },
				results = { 1, 1, 1, 1 },
				preview = { 1, 1, 1, 1 },
			},
			borderchars = {
				prompt = { "─", "│", "─", "│", "┌", "┐", "│", "│" },
				results = { " ", "│", "─", "│", "│", "│", "┘", "└" },
				preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},

			-- Borderchars MAP
			-- { "top-middle", "right-middle", "bottom-middle", "left-middle", "top-left", "top-right", "bottom-right", "bottom-left", }

			results_title = false,
			sorting_strategy = "ascending",

			layout_config = {
				horizontal = {
					width = 0.9,
					prompt_position = 'top',
					preview_width = 0.5,
				},
			},

		},
	},
}
