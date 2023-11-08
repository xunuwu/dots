local hydra = function(h)
	require('config.hydras.' .. h)
end

hydra'telescope'
hydra'debug'
hydra'lsp'
