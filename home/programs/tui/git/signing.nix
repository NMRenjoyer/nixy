# This file is used to sign git commits using an SSH key.
{
  # CHANGEDME: change this to your own SSH key.
  home.file.".ssh/allowed_signers".text = ''
    * ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA7pxE4EazA5LO1Q1hPlaoRP3OnTT02/bNZYDGIzyLBL
    * ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBi5hnQLI7JApjyhp/bgTYxo+ieXmy1NT4T3HGz4ZzBB
  '';

  programs.git = {
    settings = {
      commit.gpgsign = true;
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519_laptop.pub";
    };
  };
}
