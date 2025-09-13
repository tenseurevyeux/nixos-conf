{ pkgs, pkgsUnstable, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    anki
    imv
    mpv
    pavucontrol
    telegram-desktop
    vesktop
    pkgsUnstable.zed-editor
    libreoffice-qt6
    vscode

    # CLI utils
    bc
    bottom
    brightnessctl
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    grimblast
    htop
    hyprpicker
    ntfs3g
    mediainfo
    microfetch
    playerctl
    ripgrep
    showmethekey
    silicon
    udisks
    ueberzugpp
    unzip
    w3m
    wget
    wl-clipboard
    wtype
    yt-dlp
    zip
    file
    tcpdump
    nmap
    cava
    acpi 
    cmatrix
    openvpn
    jq

    # Coding stuff
    rustc 
    cargo
    rust-analyzer
    gcc

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    bemoji
    nix-prefetch-scripts
  ];
}
