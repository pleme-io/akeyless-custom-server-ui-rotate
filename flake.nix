{
  description = "Node.js service for automating credential rotation on websites using the Akeyless Custom Rotator with Puppeteer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      # NOTE: buildNpmPackage fails because package-lock.json references a private
      # npm registry that requires TLS certificates unavailable in the Nix sandbox.
      # Build with: npm install && node index.js

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
