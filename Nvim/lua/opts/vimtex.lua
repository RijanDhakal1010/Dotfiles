local M = {}

function M.setup()
	vim.g.vimtex_quickfix_mode = 0
	vim.g.vimtex_compiler_progname = 'nvr'
	vim.g.vimtex_view_method = 'zathura'
	vim.g.vimtex_complete_enabled = 1
end

return M
