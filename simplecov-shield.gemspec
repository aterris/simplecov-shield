# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'simplecov-shield'
  spec.version       = '0.0.3'
  spec.authors       = ['Andrew Terris', 'Lesley Dennison']
  spec.email         = ['atterris@gmail.com']
  spec.description   = %q{Shield generator for SimpleCov}
  spec.summary       = %q{Shield generator for SimpleCov}
  spec.homepage      = 'https://github.com/aterris/simplecov-shield'
  spec.license       = 'MIT'

  spec.files         = ['lib/simplecov-shield.rb']
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_path  = 'lib'

  spec.add_runtime_dependency 'httparty', '~> 0.13.0'
  spec.add_runtime_dependency 'simplecov', '~> 0.8.2'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
