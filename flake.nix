{
  description = "New Barn Ltd website";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

        rubyEnv = pkgs.bundlerEnv {
          name = "newbarnltd-co-uk";
          ruby = pkgs.ruby_3_3;
          gemfile = ./Gemfile;
          lockfile = ./Gemfile.lock;
          gemset = ./gemset.nix;
        };

        site = pkgs.stdenv.mkDerivation {
          name = "newbarnltd-co-uk";

          src = pkgs.lib.cleanSource ./.;

          nativeBuildInputs = with pkgs; [
            ruby_3_3
            minify
          ];

          configurePhase = ''
            export HOME=$TMPDIR
            mkdir -p _site
          '';

          buildPhase = ''
            echo "Building site with Jekyll..."
            JEKYLL_ENV=production ${rubyEnv}/bin/jekyll build --source . --destination _site --trace

            echo 'Minifying HTML'
            minify --all --recursive --output . _site
          '';

          installPhase = ''
            echo "Creating output directory..."
            mkdir -p $out

            echo "Copying site files..."
            cp -r _site/* $out/
          '';
        };
      in
      {
        default = site;
      });

      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          rubyEnv = pkgs.bundlerEnv {
            name = "newbarnltd-co-uk";
            ruby = pkgs.ruby_3_3;
            gemfile = ./Gemfile;
            lockfile = ./Gemfile.lock;
            gemset = ./gemset.nix;
          };
        in
        {
          default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rubyEnv
            ruby_3_3
            rubyPackages_3_3.ffi
            libffi
          ];

          shellHook = ''
            serve() {
              ${rubyEnv}/bin/jekyll serve --watch &
              JEKYLL_PID=$!

              cleanup_serve() {
                echo "Cleaning up serve process..."
                kill $JEKYLL_PID 2>/dev/null
                wait $JEKYLL_PID 2>/dev/null
              }

              trap cleanup_serve EXIT INT TERM

              wait $JEKYLL_PID

              cleanup_serve

              trap - EXIT INT TERM
            }

            export -f serve

            cleanup() {
              echo "Cleaning up..."
              rm -rf _site .jekyll-cache .jekyll-metadata
            }

            trap cleanup EXIT

            echo "Development environment ready!"
            echo "Run 'serve' to start development server"
          '';
        };
      });
    };
}