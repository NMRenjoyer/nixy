{config, ...}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/amd-graphics.nix
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
    ../../nixos/usbguard.nix
    ../../nixos/steam.nix

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
    allow id 1d6b:0002 serial "0000:0b:00.0" name "xHCI Host Controller" hash "+XquLJ1PcxL46fLrSbVNwpIn3oJQYx8VHJUWeqlOsws=" parent-hash "qhmZMemC7sbnSNxsZkf4U2x8qPJ7A6KMKeB8r+qwXus=" with-interface 09:00:00 with-connect-type ""
    allow id 1d6b:0003 serial "0000:0b:00.0" name "xHCI Host Controller" hash "J4JlQX4Hwd5BzruL3wHVfm9e9H5qBBEkonWzdhKjNXc=" parent-hash "qhmZMemC7sbnSNxsZkf4U2x8qPJ7A6KMKeB8r+qwXus=" with-interface 09:00:00 with-connect-type ""
    allow id 1d6b:0002 serial "0000:0d:00.3" name "xHCI Host Controller" hash "kfg9rWbHDmu9sziJKn54hYXgOUymiXkU/EU39jdg/GA=" parent-hash "cdghNvZ/xovKSKWI21Ni/PhRXov1mGuQqJRwQMfktac=" with-interface 09:00:00 with-connect-type ""
    allow id 1d6b:0003 serial "0000:0d:00.3" name "xHCI Host Controller" hash "nyjiuLoRZPIYxANlVmwcZIYZhmLEJXOfZnW9G6v4oFo=" parent-hash "cdghNvZ/xovKSKWI21Ni/PhRXov1mGuQqJRwQMfktac=" with-interface 09:00:00 with-connect-type ""
    allow id 1d6b:0002 serial "0000:0d:00.4" name "xHCI Host Controller" hash "J+bY7ivkCP3mXzY8CxPZaFv/hel6QjDQlxkUJEgplhU=" parent-hash "2apV7P70SWxAktQYlCEWUBR9duwQ0uGZk9hHOWOgst4=" with-interface 09:00:00 with-connect-type ""
    allow id 1d6b:0003 serial "0000:0d:00.4" name "xHCI Host Controller" hash "OKTf53LxaLt5X2BIYltpHjgWmzGD4M9CDcKGzm74vLg=" parent-hash "2apV7P70SWxAktQYlCEWUBR9duwQ0uGZk9hHOWOgst4=" with-interface 09:00:00 with-connect-type ""
    allow id 1d6b:0002 serial "0000:0e:00.0" name "xHCI Host Controller" hash "xC/Xrki0O6r5exDqQM4uxZuqVb6Gkr9vOpEWDuIwXd8=" parent-hash "kYIzLjWNfrKhDaP9wnd7ysWHody5nCQUF6qPI58rn2U=" with-interface 09:00:00 with-connect-type ""
    allow id 174c:2074 serial "" name "ASM107x" hash "3diggCc+UIkz1I9skI/9PxceyT0kr5r7GL5FqNeqFZg=" parent-hash "+XquLJ1PcxL46fLrSbVNwpIn3oJQYx8VHJUWeqlOsws=" via-port "1-4" with-interface { 09:00:01 09:00:02 } with-connect-type "not used"
    allow id 13d3:3617 serial "00E04C885A01" name "Bluetooth Radio" hash "T/DmH8LreKfpA40nMES/cwDkaBYM6GEIycqFtGvK8Yc=" parent-hash "+XquLJ1PcxL46fLrSbVNwpIn3oJQYx8VHJUWeqlOsws=" with-interface { e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 } with-connect-type "not used"
    allow id 174c:3074 serial "" name "ASM107x" hash "u+NgVC10sqnPD0Rf2fZCa9joVQ4VZhizQq2ArhktmFg=" parent-hash "J4JlQX4Hwd5BzruL3wHVfm9e9H5qBBEkonWzdhKjNXc=" via-port "2-4" with-interface 09:00:00 with-connect-type "not used"
    allow id 1532:0084 serial "" name "Razer DeathAdder V2" hash "DKoKsl9fhBiix7UBPTB4XwcdhV1Qu5cHdS4IUE6Raao=" parent-hash "kfg9rWbHDmu9sziJKn54hYXgOUymiXkU/EU39jdg/GA=" via-port "3-1" with-interface { 03:01:02 03:00:01 03:01:01 03:00:02 } with-connect-type "hotplug"
    allow id 03f0:3454 serial "TH04R2C062" name "ENVY 6000 series" hash "Cxcs1yV+e7EwxMGavTOw/qos+93MGzx472UwVDjwBLg=" parent-hash "kfg9rWbHDmu9sziJKn54hYXgOUymiXkU/EU39jdg/GA=" with-interface { ff:cc:00 07:01:04 07:01:02 ff:04:01 07:01:04 ff:04:01 07:01:04 } with-connect-type "hotplug"
    allow id 1038:2232 serial "" name "SteelSeries Arctis Nova 5" hash "nEOrA7nRQL7etlg9Q5vmhbtBvctycRk2oA6dshoSEWk=" parent-hash "J+bY7ivkCP3mXzY8CxPZaFv/hel6QjDQlxkUJEgplhU=" via-port "5-1" with-interface { 01:01:00 01:02:00 01:02:00 01:02:00 01:02:00 03:00:00 03:00:00 03:00:00 } with-connect-type "hotplug"
    allow id 046d:082d serial "1293769F" name "HD Pro Webcam C920" hash "UWNDdLGp91oZqFVm1+gzs1Hh3YoeOH60YloMSEzIgbM=" parent-hash "xC/Xrki0O6r5exDqQM4uxZuqVb6Gkr9vOpEWDuIwXd8=" with-interface { 0e:01:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 01:01:00 01:02:00 01:02:00 01:02:00 01:02:00 } with-connect-type "hotplug"
    allow id 0b05:19af serial "9876543210" name "AURA LED Controller" hash "ivD4BdPa74ISz19OCKpiZy4RrkpyARqnN3oBXm49dnA=" parent-hash "+XquLJ1PcxL46fLrSbVNwpIn3oJQYx8VHJUWeqlOsws=" with-interface { ff:ff:ff 03:00:00 } with-connect-type "not used"
    allow id 258a:1006 serial "" name "Gaming KB " hash "Mn4TGaF1lfaGz2gMShdXvoZvyU9zxox22dbxwV/bpFQ=" parent-hash "3diggCc+UIkz1I9skI/9PxceyT0kr5r7GL5FqNeqFZg=" via-port "1-4.4" with-interface { 03:01:01 03:01:01 } with-connect-type "hotplug"
    allow id 0483:df11 serial "206135582031" name "STM32  BOOTLOADER" hash "kafJUYMjObWViSy8YDYWETYAlozqpeqNRoET6SVgLEs=" parent-hash "+XquLJ1PcxL46fLrSbVNwpIn3oJQYx8VHJUWeqlOsws=" with-interface { fe:01:02 fe:01:02 } with-connect-type "hotplug"
    allow id 3297:1969 serial "ArqQx/Rjylqb" name "Moonlander Mark I" hash "qjz5QYO4S30R1GoI9GiVr9Xu3EnVHjzwbEHs7jh7G+A=" parent-hash "+XquLJ1PcxL46fLrSbVNwpIn3oJQYx8VHJUWeqlOsws=" with-interface { 03:01:01 03:00:00 03:00:00 } with-connect-type "hotplug"
  '';

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = "24.05";
}
