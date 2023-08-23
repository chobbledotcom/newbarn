# -*- encoding: utf-8 -*-
# stub: neocities 0.0.18 ruby lib
# stub: ext/mkrf_conf.rb

Gem::Specification.new do |s|
  s.name = "neocities".freeze
  s.version = "0.0.18"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kyle Drake".freeze]
  s.date = "2023-07-07"
  s.email = ["contact@neocities.org".freeze]
  s.executables = ["neocities".freeze]
  s.extensions = ["ext/mkrf_conf.rb".freeze]
  s.files = ["bin/neocities".freeze, "ext/mkrf_conf.rb".freeze]
  s.homepage = "https://neocities.org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.18".freeze
  s.summary = "Neocities.org CLI and API client".freeze

  s.installed_by_version = "3.4.18" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<tty-table>.freeze, ["~> 0.10", "= 0.10.0"])
  s.add_runtime_dependency(%q<tty-prompt>.freeze, ["~> 0.12", "= 0.12.0"])
  s.add_runtime_dependency(%q<pastel>.freeze, ["~> 0.7", "= 0.7.2"])
  s.add_runtime_dependency(%q<httpclient-fixcerts>.freeze, ["~> 2.8", ">= 2.8.5"])
  s.add_runtime_dependency(%q<rake>.freeze, ["~> 12.3", ">= 12.3.1"])
end
