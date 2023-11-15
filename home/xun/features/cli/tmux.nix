{
  programs.tmux = {
    enable = true;
    clock24 = true;
    secureSocket = false; # survive user logout
    extraConfig = ''
      set -sa terminal-overrides "*:Tc" # true colors

      unbind C-b
      set-option -g prefix C-Space
      bind-key C-Space send-prefix

      set -s escape-time 0
      set -g mouse on
      set -g renumber-windows on

      set -g status-interval 1
      set -g status-justify centre
      set -g status-right "#(free -m | awk 'NR==2{print $3}')/#(free -m | awk 'NR==2{print $2}')Mb  #(uname -n) %l:%M "
    '';
  };
}
