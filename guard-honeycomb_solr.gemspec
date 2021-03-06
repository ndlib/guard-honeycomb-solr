# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "guard-honeycomb_solr"
  spec.version       = "0.0.1"
  spec.authors       = ["Jaron Kennel"]
  spec.email         = ["jaronkk@gmail.com"]
  spec.description   = "Guard::HoneycombSolr automatically starts/restarts your jetty server when needed."
  spec.summary       = "Guard gem for HoneycombSolr"
  spec.homepage      = ""
  spec.license       = "Apache 2.0"

  spec.files         = Dir.glob('{lib}/**/*') + %w[LICENSE.txt README.md]
  spec.require_paths = ["lib"]

  spec.add_dependency "guard", ">= 1.8"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "guard-bundler", ">= 1.0"
  spec.add_development_dependency "guard-rspec", "~> 3.1"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec", ">= 2.14.1"
end
