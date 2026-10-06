{
  description = "Ithnaan development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f nixpkgs.legacyPackages.${system}
        );
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            fish
            bun
            nodejs_24
          ];

          shellHook = ''
            echo "Ithnaan development environment"
            echo "Bun:  $(bun --version)"
            echo "Node: $(node --version)"
            exec fish
          '';
        };
      });
    };
}
