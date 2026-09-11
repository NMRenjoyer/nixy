# This file is used to sign git commits using an SSH key.
{
  # CHANGEDME: change this to your own SSH key.
  home.file.".ssh/allowed_signers".text = ''
    * ssh-ed25519
    * ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBlvO3Hkqrz8C6+rPFLsaonMnf1wIYT4/Wr6I3V662IR
  '';

  programs.git = {
    settings = {
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519_signing.pub";
    };
  };
}
