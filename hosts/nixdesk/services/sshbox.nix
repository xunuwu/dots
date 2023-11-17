{inputs, ...}: {
  containers.sshbox = {
    autoStart = true;
    config = {
      config,
      pkgs,
      lib,
      ...
    }: {
      nix.settings = {
        trusted-users = ["root" "@wheel"];
        auto-optimise-store = lib.mkDefault true;
        experimental-features = ["nix-command" "flakes" "repl-flake"];
      };

      nixpkgs.config.allowUnfree = true;

      services.openssh = {
        enable = true;
        ports = [222];
      };

      environment.systemPackages = with pkgs; [
        nano
        htop
        btop
        busybox
        git
        ripgrep
        lf
        fzf
        tmux
      ];

      users.users.eksi = {
        isNormalUser = true;
        initialPassword = "password123";
        packages = [
          inputs.neovim.packages.${pkgs.system}.neovim

          pkgs.python3
          pkgs.clang
          pkgs.lua
          pkgs.nethack
        ];
      };
    };
  };
}
