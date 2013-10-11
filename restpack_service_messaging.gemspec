# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'restpack_service_messaging/version'

Gem::Specification.new do |spec|
  spec.name          = "restpack_service_messaging"
  spec.version       = RestPack::Service::VERSION
  spec.authors       = ["Gavin Joyce"]
  spec.email         = ["gavinjoyce@gmail.com"]
  spec.description   = %q{RestPack Service Messaging}
  spec.summary       = %q{A simple mechanism for sending messages to services without knowing much about them}
  spec.homepage      = "https://github.com/RestPack"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mutations",            "~> 0.6.0"
  spec.add_dependency "require_all",          "~> 1.3.0"
  spec.add_dependency "restpack_gem"
  spec.add_dependency "rubykiq"

  spec.add_development_dependency "bundler",  "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bump"
end
