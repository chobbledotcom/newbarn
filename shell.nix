with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    bundler
    html-minifier
    neocities-cli
    sass
  ];
}
