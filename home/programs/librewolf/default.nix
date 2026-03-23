{pkgs, ...}: {
  programs.librewolf = {
    enable = true;
    policies = {
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "normal_installed";
          private_browsing = true;
        };
      };
    };
  };
}
