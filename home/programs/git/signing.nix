# This file is used to sign git commits using an SSH key.
{
  home.file.".ssh/allowed_signers".text = "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHZKN+lNdaDrBwNC6eR4UzwXm+teEUl4oEilRaiSJUtV dcreetz@nixos-desktop";

  programs.git = {
    signing.format = "openpgp";
    settings = {
      commit.gpgsign = true;
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/key.pub";
    };
  };
}
