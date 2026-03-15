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
      packages.default = pkgs.buildNpmPackage {
        pname = "akeyless-custom-server-ui-rotate";
        version = "0.0.0-dev";
        src = self;
        npmDepsHash = "sha256-8RuhJiwvPZWTf+bsWOtUDkiAjtM3XfZCCSMfy4DB9jg="; # TODO: set correct hash
        dontNpmBuild = true;
        meta = {
          description = "Node.js service for automating credential rotation on websites using the Akeyless Custom Rotator with Puppeteer";
          homepage = "https://github.com/pleme-io/akeyless-custom-server-ui-rotate";
          license = pkgs.lib.licenses.mit;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
