{
  description = "A template for Lean 4 projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            elan
            gnumake
            git
            graphviz
            pre-commit
            uv
            python315
          ];

          shellHook = ''
            echo "Lean 4 development shell loaded."
            echo "elan version: $(elan --version 2>/dev/null || echo 'not found')"
            echo "Run 'make help' to see available Makefile targets."
          '';
        };
      }
    );
}
