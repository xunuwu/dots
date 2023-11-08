local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = vim.split([[
ooooo      ooo                                  o8o                    
`888b.     `8'                                  `"'                    
 8 `88b.    8   .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.   
 8   `88b.  8  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b  
 8     `88b.8  888ooo888 888   888   `88..8'    888   888   888   888  
 8       `888  888    .o 888   888    `888'     888   888   888   888  
o8o        `8  `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o 
]], '\n')

dashboard.section.header.opts.hl = '@alpha.title'
dashboard.section.buttons.val = {
	{ type = 'padding', val = 1 },
	dashboard.button('e', ' ' .. ' | New file', ":ene<CR>"),
	dashboard.button('f', ' ' .. ' | Find file', ":lua require'telescope.builtin'.find_files()<CR>" ),
	dashboard.button('r', '󰉇 ' .. ' | Recent', ":lua require'telescope.builtin'.oldfiles()<CR>" ),
	dashboard.button('g', ' ' .. ' | Gitui', ":Gitui<CR>" ),
	dashboard.button('q', '󰗼 ' .. ' | Quit', ":qa!<CR>" ),
}

require'alpha'.setup(dashboard.opts)
