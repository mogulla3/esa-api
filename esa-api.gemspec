lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "esa/version"

Gem::Specification.new do |spec|
  spec.name          = "esa-api"
  spec.version       = Esa::VERSION
  spec.authors       = ["mogulla3"]
  spec.email         = ["hs.iarn3@gmail.com"]
  spec.summary       = %q{A Ruby interface to the esa API.}
  spec.description   = %q{A Ruby interface to the esa API.}
  spec.homepage      = "https://github.com/mogulla3/esa-api"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock"
end
