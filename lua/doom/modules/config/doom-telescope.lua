-- https://github.com/nvim-telescope/telescope.nvim#telescope-defaults
return function()
	local telescope = require('telescope')
	-- Required to close with ESC in insert mode
	local actions = require('telescope.actions')

	telescope.setup({
		defaults = {
			find_command = {
				'rg',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
			},
			prompt_position = 'bottom',
			prompt_prefix = '>',
			initial_mode = 'insert',
			selection_strategy = 'reset',
			sorting_strategy = 'descending',
			layout_strategy = 'horizontal',
			layout_defaults = {
				-- TODO add builtin options.
			},
			file_sorter = require('telescope.sorters').get_fuzzy_file,
			file_ignore_patterns = {},
			generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
			shorten_path = true,
			winblend = 0,
			width = 0.75,
			preview_cutoff = 80,
			results_height = 1,
			results_width = 0.8,
			border = {},
			borderchars = {
				'─',
				'│',
				'─',
				'│',
				'╭',
				'╮',
				'╯',
				'╰',
			},
			color_devicons = true,
			use_less = true,
			set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
			file_previewer = require('telescope.previewers').vim_buffer_cat.new,
			grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
			qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

			-- Developer configurations: Not meant for general override
			buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
			mappings = {
				i = {
					['<C-j>'] = actions.move_selection_next,
					['<C-k>'] = actions.move_selection_previous,
					['<C-q>'] = actions.smart_send_to_qflist
						+ actions.open_qflist,
					['<Leader>f'] = actions.close, -- works like a toggle, sometimes can be buggy
					['<CR>'] = actions.select_default + actions.center,
				},
				n = {
					['<C-j>'] = actions.move_selection_next,
					['<C-k>'] = actions.move_selection_previous,
					['<C-q>'] = actions.smart_send_to_qflist
						+ actions.open_qflist,
				},
			},
		},
	})
end
