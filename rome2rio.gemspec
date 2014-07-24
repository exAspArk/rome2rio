lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rome2rio/version'

Gem::Specification.new do |gem|
  gem.name = "rome2rio"
  gem.version = Rome2rio::VERSION
  gem.authors = ["exAspArk"]
  gem.email = ["exAspArk@gmail.com"]
  gem.description = "A Ruby wrapper for the Rome2rio API. See http://www.rome2rio.com/documentation/search for the official documentation."
  gem.summary = "A Ruby wrapper for the Rome2rio API."
  gem.homepage = "http://github.com/exAspArk/rome2rio"
  gem.license = "MIT"

  gem.add_dependency 'faraday'
  gem.add_dependency 'multi_json'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
end
