{
  description = "Lua dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          # pick exactly one interpreter; comment the other
          # (lua5_4.withPackages (ps: with ps; [luafilesystem luaposix]))
          luajit
          lua-language-server
          nodePackages_latest.vscode-json-languageserver
          stylua # formatter
          luarocks # rock management
          readline # nicer REPL history
        ];

        shellHook = ''
          echo "Lua shell on ${pkgs.luajit.version} – happy vim!"
        '';
      };
    });
}
