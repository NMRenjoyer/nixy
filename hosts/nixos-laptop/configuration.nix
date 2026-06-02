{config, ...}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/nvidia.nix # CHANGEDME: Remove this line if you don't have an Nvidia GPU
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/sddm.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/hyprland.nix
    ../../nixos/print.nix
    #../../nixos/usbguard.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  # USBGuard:
  # Allow all USB devices until a proper policy is configured.
  # Run `sudo usbguard generate-policy` with your devices plugged in,
  # then set rules = "<output>" and switch implicitPolicyTarget to "block".
  # services.usbguard.implicitPolicyTarget = lib.mkForce "allow";

  services.usbguard.rules = ''
    allow id 1d6b:0002 serial "0000:00:14.0" name "xHCI Host Controller" hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" parent-hash "rV9bfLq7c2eA4tYjVjwO4bxhm+y6GgZpl9J60L0fBkY=" with-interface 09:00:00 with-connect-type ""
    allow id 1d6b:0003 serial "0000:00:14.0" name "xHCI Host Controller" hash "prM+Jby/bFHCn2lNjQdAMbgc6tse3xVx+hZwjOPHSdQ=" parent-hash "rV9bfLq7c2eA4tYjVjwO4bxhm+y6GgZpl9J60L0fBkY=" with-interface 09:00:00 with-connect-type ""
    allow id 21c4:0cc7 serial "56025F983BC14F87" name "USB Flash Drive" hash "VGdaXu6XjM9tsqyl9UiWuTdiPW8doSaBA2xvMtHcGXQ=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" with-interface 08:06:50 with-connect-type "hotplug"
    allow id 04f2:b5ee serial "" name "HP HD Camera" hash "+kv2UrVYZpX2IHWmcrLPD/+Xjc259lS6vreK/QdB81A=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" via-port "1-7" with-interface { 0e:01:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 } with-connect-type "hardwired"
    allow id 138a:00ab serial "26169486a445" name "" hash "dKFg/oZRabR3LGFGQNreXBS9jWBkNwuZqwzy24vajbA=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" with-interface ff:00:00 with-connect-type "hardwired"
    allow id 8087:0aaa serial "" name "" hash "BpLyFNeiMugqZSYbuMBAIxEhNoXynuj0UMg83HPZkdU=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" via-port "1-14" with-interface { e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 } with-connect-type "hardwired"
  '';

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = "24.05";
}
