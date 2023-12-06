{
  config,
  pkgs,
  inputs,
  ...
}: rec {
  gtk = {
    enable = true;
    font = {
      name = config.fontProfiles.regular.family;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = "${gtk.theme.name}";
      "Net/IconThemeName" = "${gtk.iconTheme.name}";
    };
  };
}
