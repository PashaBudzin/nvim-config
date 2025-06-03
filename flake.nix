{
  description = "My Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, ... }: {
    packages = {
      x86_64-linux.default = self;
      aarch64-linux.default = self;
    };

    homeManagerModules.default = { pkgs, ... }: {
      home.file.".config/nvim".source = self;
      home.packages = with pkgs; [
        # neovim
        neovim

        fzf
        fd
        ripgrep

        # LSPS
        lua-language-server
        typescript-language-server
        rust-analyzer
        vscode-langservers-extracted
        yaml-language-server
        pyright
        codespell
        stylua
        prettierd
        gcc
        gopls
        nixfmt-classic

        tree-sitter
      ];
    };
  };
}
