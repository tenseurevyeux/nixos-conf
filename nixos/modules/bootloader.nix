{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.blacklistedKernelModules = [
        "kvm"
        "kvm_intel"
        "kvm_amd"
  ];
}
