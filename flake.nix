{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...}: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    config = pkgs.stdenv.mkDerivation {
      name = "dotfiles-nvim";
      version = "unstable";
      src = ./.;
      installPhase = ''
        mkdir -p $out 
        cp ./* $out/ -r
      '';
    };

    extraPackages = with pkgs; [
        lazygit
        wget
        git
        gh
        gcc
        ripgrep
        fd

        nodejs
        tree-sitter

        nvimpager
    ];

    nvimPath = pkgs.lib.makeBinPath extraPackages;
  in
  {
    packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
      pname = "my-nvim";
      version = "unstable";

      extraMakeWrapperArgs = [
      "--set" "PATH" "${nvimPath}"
      ];
      luaRcContent = /* lua */ ''
        vim.opt.runtimepath:prepend("${config}")
        vim.env.PATH = "${nvimPath}:" .. (vim.env.PATH or "")
        dofile("${config}/init.lua")
      '';
    };

    # nixosModules = {
    #   nvim = import ./nvim.nix;
    # };
  };
}
