{
  lib,
  pkgs,
  config,
  ...
}: {
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 20;
      bar-height = 36;
      gaps-in = 8;
      gaps-out = 8 * 2;
      active-opacity = 0.96;
      inactive-opacity = 0.92;
      blur = false;
      border-size = 2;
      animation-speed = "very-fast"; # "very-fast" | "fast" | "medium" | "slow"
    };
    description = "Theme configuration options";
  };

  config.stylix = {
    enable = true;

    # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
    base16Scheme = {
      base00 = "ffffff"; # Default Background
      base01 = "bbfbd7"; # Lighter Background (Used for status bars, line number and folding marks)
      base02 = "bbfbd7"; # Selection Background
      base03 = "80f1b2"; # Comments, Invisibles, Line Highlighting
      base04 = "4fe291"; # Dark Foreground (Used for status bars)
      base05 = "29cd72"; # Default Foreground, Caret, Delimiters, Operators
      base06 = "0cb356"; # Light Foreground (Not often used)
      base07 = "00933d"; # Light Background (Not often used)
      base08 = "006d27"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = "ffa190"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "dcc264"; # Classes, Markup Bold, Search Text Background
      base0B = "9be16e"; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "6feda7"; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "72deee"; # Functions, Methods, Attribute IDs, Headings, Accent color
      base0E = "a2bdff"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "e49dff"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
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
        package = pkgs.rubik;
        name = "Rubik";
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
    image = ./bg.jpg;
  };
}
