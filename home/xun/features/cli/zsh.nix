{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
      ];
    };
    initExtra = ''
      		unsetopt beep
      		PROMPT="%F{blue}[%F{magenta}%n%F{blue}@%F{magenta}%M%F{blue}] %~%f %(?..%F{red}| %? )%#%f "
      		'';
  };
}
