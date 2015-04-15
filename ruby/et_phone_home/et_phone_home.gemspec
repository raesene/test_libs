# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'et_phone_home/version'

Gem::Specification.new do |spec|
  spec.name          = "et_phone_home"
  spec.version       = EtPhoneHome::VERSION
  spec.authors       = ["Rory McCune"]
  spec.email         = ["rorym@mccune.org.uk"]

  spec.summary       = %q{A gem that just phone home by going a GET on a specific URL}
  spec.description   = %q{part of a library security project.  Please see http://raesene.github.io/blog/2015/03/01/software-library-repositories-and-security/ for more information}
  spec.homepage      = "https://github.com/raesene/test_libs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ["Rakefile"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
