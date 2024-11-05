with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    ruby_3_3
    html-minifier
    neocities-cli
    sass
  ];
}
