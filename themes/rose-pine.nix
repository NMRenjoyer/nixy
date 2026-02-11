{
  lib,
  pkgs,
  config,
  ...
}: {
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 30;
      gaps-in = 12;
      gaps-out = 12 * 2;
      active-opacity = 0.96;
      inactive-opacity = 0.94;
      blur = true;
      border-size = 4;
      animation-speed = "fast"; # "fast" | "medium" | "slow"
      fetch = "none"; # "nerdfetch" | "neofetch" | "pfetch" | "none"
      textColorOnWallpaper =
        config.lib.stylix.colors.base00; # Color of the text displayed on the wallpaper (Lockscreen, display manager, ...)
    };
    description = "Theme configuration options";
  };

  config.stylix = {
    enable = true;

    # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
    base16Scheme = {
      base00 = "edf9dc"; # Default Background
      base01 = "c6e994"; # Lighter Background (Used for status bars, line number and folding marks)
      base02 = "a2d558"; # Selection Background
      base03 = "81bd29"; # Comments, Invisibles, Line Highlighting
      base04 = "62a207"; # Dark Foreground (Used for status bars)
      base05 = "478300"; # Default Foreground, Caret, Delimiters, Operators
      base06 = "2e6000"; # Light Foreground (Not often used)
      base07 = "183900"; # Light Background (Not often used)
      base08 = "ff6a72"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = "d1912d"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "7fbc27"; # Classes, Markup Bold, Search Text Background
      base0B = "3bd364"; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "2fc8c0"; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "61a1ff"; # Functions, Methods, Attribute IDs, Headings, Accent color
      base0E = "b376ff"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "f75fce"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    };

    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 20;
    };

    fonts = {
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };
      sansSerif = {
        package = pkgs.source-sans-pro;
        name = "Source Sans Pro";
      };
      serif = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };

    polarity = "light";
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/pink-clouds.png";
      sha256 = "sha256-IvINf62mg9rKjml4sh8hl/j7UHrQQlbm6QnZTaI+TRk=";
    };
  };
}
