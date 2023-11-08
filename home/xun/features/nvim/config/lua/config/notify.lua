require'notify'.setup({
		timeout = 3000,
		stages = 'fade',
		render = 'minimal',
		opacity = 100,
})

vim.notify = require'notify'

