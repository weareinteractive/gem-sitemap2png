# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sitemap2png/version'

Gem::Specification.new do |spec|
  spec.name          = "sitemap2png"
  spec.version       = Sitemap2png::VERSION
  spec.authors       = ["franklin"]
  spec.email         = ["franklin@weareinteractive.com"]
  spec.description   = %q{Commandline tool to take screenshots of all pages defined through a sitemap.xml in different resolutions.}
  spec.summary       = %q{Takes screenshots of all pages defined in a sitemap.xml.}
  spec.homepage      = "https://github.com/weareinteractive/gem-sitemap2png"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "xml-simple"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "bundler"
end
