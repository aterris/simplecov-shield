# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

#require 'simplecov-shield'

Gem::Specification.new do |spec|
  spec.name          = 'simplecov-shield'
  spec.version       = '0.0.1'#SimpleCov::Formatter::ShieldFormatter::VERSION
  spec.authors       = ['Andrew Terris']
  spec.email         = ['atterris@gmail.com']
  spec.description   = %q{Shield generator for SimpleCov}
  spec.summary       = %q{Shield generator for SimpleCov}
  spec.homepage      = 'https://github.com/aterris/simplecov-shield'
  spec.license       = 'MIT'

  spec.files         = ['lib/simplecov_shield.rb']#{}`git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_path  = 'lib'

  spec.add_runtime_dependency 'httparty', '~> 0.13.0'

  spec.add_development_dependency 'bundler', '~> 1.6.2'
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
end
