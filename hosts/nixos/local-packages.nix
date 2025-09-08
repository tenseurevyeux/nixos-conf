{ pkgs, pkgsUnstable, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];

  # Amnezia-Vpn
  programs.amnezia-vpn.enable = true;
  systemd.services.amnezia-vpn-service.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "tenseurevyeux" ];
   virtualisation.virtualbox.host.enableExtensionPack = true;
}
