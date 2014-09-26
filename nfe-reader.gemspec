# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nfe_reader/version'

Gem::Specification.new do |spec|
  spec.name          = "nfe_reader"
  spec.version       = Nfe::Reader::VERSION
  spec.authors       = ["Eduardo Becker"]
  spec.email         = ["edu.bkr@gmail.com"]
  spec.summary       = %q{NFe XML Extractor}
  spec.description   = %q{NFe XML Extractor}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "turn", "~> 0.9"
  spec.add_dependency "nokogiri", "~> 1.6"
end
