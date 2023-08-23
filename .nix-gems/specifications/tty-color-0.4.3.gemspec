# -*- encoding: utf-8 -*-
# stub: tty-color 0.4.3 ruby lib

Gem::Specification.new do |s|
  s.name = "tty-color".freeze
  s.version = "0.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.date = "2018-07-11"
  s.description = "Terminal color capabilities detection".freeze
  s.email = ["".freeze]
  s.homepage = "http://piotrmurach.github.io/tty".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.18".freeze
  s.summary = "Terminal color capabilities detection".freeze

  s.installed_by_version = "3.4.18" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, [">= 1.5.0", "< 2.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
end
