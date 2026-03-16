{
  description = "Node.js service for automating credential rotation on websites using the Akeyless Custom Rotator with Puppeteer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  # NOTE: buildNpmPackage fails — package-lock.json references a private npm registry.
  # Build manually: npm install && node index.js
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    description = "Node.js service for automating credential rotation on websites using the Akeyless Custom Rotator with Puppeteer";
  };
}
