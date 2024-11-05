with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    bundler
    html-minifier
    lightningcss
    neocities-cli
    nodejs
    nodePackages.pnpm
    sass
  ];
}
