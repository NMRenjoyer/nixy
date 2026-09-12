{
  pkgs,
  config,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  boot.kernelParams = [
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia-drm.fbdev=0"
  ];

  nixpkgs.config.nvidia.acceptLicense = true;

  hardware = {
    nvidia = {
      open = false;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;

      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

      prime = {
        sync.enable = true;
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
  };
}
