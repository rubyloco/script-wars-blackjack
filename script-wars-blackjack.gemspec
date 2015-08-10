# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'script_wars_blackjack/version'

Gem::Specification.new do |spec|
  spec.name          = 'script-wars-blackjack'
  spec.version       = ScriptWarsBlackjack::VERSION
  spec.authors       = ['Hunter Madison', 'Chris Mar']
  spec.email         = ['hunterglenmadison@icloud.com']

  spec.summary       = %q{Script Wars: Blackjack}
  spec.homepage      = 'http://rubyloco.com/'


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
