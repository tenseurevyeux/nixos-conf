{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      python311Packages.python-lsp-server
      nixd
      vimPlugins.nvim-treesitter-parsers.hyprlang
    ];
  };
}
