{config, ...}: {
  imports = [
    # Mostly system related configuration
    #../../nixos/nvidia.nix # CHANGEDME: Remove this line if you don't have an Nvidia GPU
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/tuigreet.nix
    ../../nixos/autologin.nix # Skip first TUIGreet login, use LUKS password to unlock the keyring
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/hyprland.nix
    ../../nixos/steam.nix
    ../../nixos/kernel-hardening.nix
    ../../home/programs/gui/helium/system.nix # I hate browser's configuration..

    ../../nixos/zsa-keyboard.nix

    # CHANGEDME: You should probably remove those things:

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  users.users.${config.var.username}.hashedPassword = "$y$j9T$Ku8rs9sQAwL5DBr6mIgDq.$4ZkDT2JT.zlm3wMr9ZrmQcyfeHJAuuABubav5myJ3j4"; # CHANGEDME: This is my password

  # Don't touch this
  system.stateVersion = "26.05";
}
