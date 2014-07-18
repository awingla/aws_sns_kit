# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_sns_kit/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_sns_kit"
  spec.version       = AwsSnsKit::VERSION
  spec.authors       = ["Tsubasa Ito"]
  spec.email         = ["stpanisush@gmail.com"]
  spec.summary       = %q{Easy integration for AWS SNS.}
  spec.description   = %q{Easy integration for AWS SNS.}
  spec.homepage      = "https://github.com/awingla/aws_sns_kit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "activerecord", ">= 3.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-activemodel-mocks"

  spec.add_dependency "railties"
  spec.add_dependency "aws-sdk"
end
