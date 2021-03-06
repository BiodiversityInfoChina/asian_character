# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asian_character/version'

Gem::Specification.new do |spec|
  spec.name          = "asian_character"
  spec.version       = AsianCharacter::VERSION
  spec.authors       = ["Jiangning Wang", "Dmitry Mozzherin"]
  spec.email         = ["wangjn1982@163.com", "dmozzherin@gmail.com"]
  spec.description   = %q{Provides some functions of Chinese}
  spec.summary       = %q{Provides some functions of Chinese}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.6"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "webmock", "~> 1.13"
  spec.add_development_dependency "debugger", "~> 1.6"
end
