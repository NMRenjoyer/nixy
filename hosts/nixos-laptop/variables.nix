{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
<<<<<<< HEAD:hosts/laptop/variables.nix
    ../../themes/zen.nix
=======
    ../../themes/shaymin.nix
>>>>>>> f024cd0 (first commit):hosts/nixos-laptop/variables.nix
  ];

  config.var = {
    hostname = "nixos-laptop";
    username = "dcreetz";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Chicago";
    timeZone = "America/Chicago";
    defaultLocale = "en_US.UTF-8";

    git = {
      username = "NMRenjoyer";
      email = "dcreetz+github@proton.me";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # DON'T TOUCH THIS
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
