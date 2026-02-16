{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.firefox = {
    enable = true;
    policies = lib.mkMerge [
      (import ./policies.nix {inherit config pkgs lib;})
      (import ./extensions.nix {inherit config pkgs lib;})
      {}
    ];
    profiles = {
      "dcreetz" = {
        id = 0;
        isDefault = true;
        userContent = import ./userContent.nix;
        userChrome = import ./userChrome.nix;
        settings = import ./preferences.nix;
        containers = import ./containers.nix;
        search = import ./search.nix;
      };
    };
  };
}
