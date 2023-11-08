{
	programs.zsh = {
		autocd = true;
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
			];
		};
		initExtra = ''
		unsetopt beep
		PROMPT="%F{blue}[%F{magenta}%n%F{blue}@%F{magenta}%M%F{blue}] %~%f %(?..%F{red}| %? )%#%f "
		'';
	};
}
