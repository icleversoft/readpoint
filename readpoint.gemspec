# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'readpoint/version'

Gem::Specification.new do |gem|
  gem.name          = "readpoint"
  gem.version       = Readpoint::VERSION
  gem.authors       = ["icleversoft"]
  gem.email         = ["iphone@icleversoft.com"]
  gem.description   = %q{Readpoint}
  gem.summary       = %q{Simple gem that implements all the WSDL operations of readpoint's soap service.'}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'savon' #>2.0.2
end
