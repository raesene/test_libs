# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rmm_eicar_test/version'

Gem::Specification.new do |spec|
  spec.name          = "rmm_eicar_test"
  spec.version       = RmmEicarTest::VERSION
  spec.authors       = ["Rory McCune"]
  spec.email         = ["rorym@mccune.org.uk"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{A Test gem with a harmless payload that should get flagged up by A-V systems}
  spec.description   = %q{Part of the testing libs that I'm doing for various things relating to library security.  This one includes the EICAR test file which is a harmless file that should be picked up by A-V systems.}
  spec.homepage      = "https://github.com/raesene/test_libs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
