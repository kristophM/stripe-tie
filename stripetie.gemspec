# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stripetie/version'

Gem::Specification.new do |spec|
  spec.name          = "stripetie"
  spec.version       = Stripetie::VERSION
  spec.authors       = ["kristophM"]
  spec.email         = ["krist.m@gmail.com"]

  spec.summary       = %q{A powerful interface to cache and query Stripe objects}
  spec.description   = %q{Creates ActiveRecord models with useful scopes and methods to cache, query, and manipulate Stripe objects as if they were local}
  spec.homepage      = "https://github.com/kristophM/stripe-tie"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  #! Separate non-development dependencies?
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails", "~> 3.4"
  spec.add_development_dependency "rails", "~> 4.2"
  spec.add_development_dependency "stripe", "~> 1.42"
  spec.add_development_dependency "activerecord", "~> 4.2.6"
  spec.add_development_dependency "pg", "~> 0.18.4"
  spec.add_development_dependency "stripe-ruby-mock", "~> 2.2.4"
  spec.add_development_dependency "stripe_mock"
  spec.add_development_dependency "factory_girl", "~> 4.7.0"
  spec.add_development_dependency "faker", "~> 1.6.3"
  spec.add_development_dependency "database_cleaner", "~> 1.5.3"

end
