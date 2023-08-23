#!/usr/bin/env

bundle config jobs 4
bundle install
export JEKYLL_ENV=production
bundle exec jekyll build

html-minifier --input-dir _site --output-dir _site --file-ext html --collapse-whitespace --minify-css --remove-comments --remove-attribute-quotes --remove-redundant-attributes

set +x
export NEOCITIES_API_KEY=$(cat /home/user/.neocities/newbarn)
set -x

gem install --no-document neocities
neocities push --prune _site

git add .
git commit -m "auto-updated after build"
git push