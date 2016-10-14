# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara/danger_zone/version'

Gem::Specification.new do |spec|
  spec.name          = 'capybara-danger_zone'
  spec.version       = Capybara::DangerZone::VERSION
  spec.authors       = ['Zach Taylor']
  spec.email         = ['taylorzr@gmail.com']

  spec.summary       = 'Capybara extension that warns you when query wait times are too close to the limit'
  spec.homepage      = 'https://github.com/taylorzr/capybara-danger_zone'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'capybara'
end
