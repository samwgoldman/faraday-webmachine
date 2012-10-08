# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faraday-webmachine/version'

Gem::Specification.new do |gem|
  gem.name          = "faraday-webmachine"
  gem.version       = Faraday::Webmachine::VERSION
  gem.authors       = ["Sam Goldman", "Sam Livingston-Gray"]
  gem.email         = ["samwgoldman@gmail.com", "geeksam@gmail.com"]
  gem.description   = %q{Faraday adapter for Webmachine}
  gem.summary       = %q{Pretty much what it says on the tin}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday'
  gem.add_dependency 'webmachine'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cane'
end
