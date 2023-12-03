-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Remap jk to Escape 
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })


-- Personal tab options
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Set splitright
vim.o.splitright = true

return {
	{
		require('onedark').setup {
			style = 'darker',
			transparent = true,
			lualine = {
				transparent = true
			},
		},
	},
}
