#!/usr/bin/env

export JEKYLL_ENV=production
set +x
export NEOCITIES_API_KEY=$(cat ~/.neocities/newbarn)
set -x
rm -rf _site
bundle install
bundle exec jekyll build
html-minifier --input-dir _site --output-dir _site --collapse-whitespace --file-ext html
neocities push --prune _site
