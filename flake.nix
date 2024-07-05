{

  description = "Global packages for R, Zig, and Neovim";



  inputs = {

    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";# Current stable relese

  };



  outputs = { self, nixpkgs }: let

    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

  in {

    packages.${system}.default = pkgs.buildEnv {

      name = "global-packages";

      paths = with pkgs; [

        R
        quarto

        rPackages.tidyverse
        rPackages.data_table
        rPackages.arrow
        rPackages.languageserver
        rPackages.odbc
        rPackages.shiny

        pipx
        python312Packages.radian

        julia
        go
        rustup
        conda

        zig
        cmake
        libgcc

        neovim
        neovide
        zellij
        yazi
        fzf
        ripgrep
        fd
        fastfetch
	lazygit

      ];

    };

  };

}
