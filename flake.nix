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

  outputs = {self, nixpkgs, ...}: 
    let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    lib = pkgs.lib;

    appname = "nvim";

    quartoPatched = pkgs.quarto.overrideAttrs (oldAttrs: { # Remove this overrideAttrs patch when fixed. See https://github.com/NixOS/nixpkgs/issues/519484#issuecomment-4667477454
        postPatch = (oldAttrs.postPatch or "") + ''
        substituteInPlace bin/quarto.js \
        --replace-fail "syntax-highlighting" "highlight-style"
        '';
        });

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
        quartoPatched
    ];

    nvimPath = lib.makeBinPath extraPackages;

    nvVersion = "0.12.5";

    nvUnwrapped = pkgs.neovim-unwrapped.overrideAttrs {
      version = nvVersion;

      src = pkgs.fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        tag = "v${nvVersion}";
        hash = "sha256-dpu2kncpm+2k+XR7qOEi4KeEy9a1E6X7kjf3s4AbcSo=";
      };
    };
  in
  {
    packages.${system} = {

      config = pkgs.linkFarm "${appname}-config" [
        {
          name = appname;
          path = lib.cleanSourceWith {
            src = ./.;
            filter = fpath: type: !lib.hasSuffix "init.lua" fpath;
          };
        }
      ];


        default = 
        let 
          config = self.packages.${system}.config;
        in
          pkgs.wrapNeovimUnstable nvUnwrapped
        {

        luaRcContent = builtins.readFile ./init.lua;
        wrapRc = true;

        withPython3 = true;
        extraPython3Packages = ps: with ps; [
          pynvim
          jupyter-client
        ];

        pname = "my-nvim";
        version = "unstable";
        wrapperArgs = [
        "--set" "NVIM_APPNAME" "${appname}"
        "--prefix" "PATH" ":" "${nvimPath}"
        "--prefix" "XDG_CONFIG_DIRS" ":" "${config}"
        ];
      };
    };

    nixosModules = {
      nvim = { ... }: {
        environment = {
          systemPackages = with pkgs; [
              self.packages.${system}.default
              nvimpager
          ] ++ extraPackages;

          variables = { 
            EDITOR = "nvim"; 
            VISUAL = "nvim"; 
            PAGER = "nvimpager";
          };
        };


      };
    };
  };
}
