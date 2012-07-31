# -*- encoding: utf-8 -*-
require File.expand_path('../lib/easy_class_constants/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bookrenter/Rafter"]
  gem.email         = ["cp@bookrenter.com"]
  gem.description   = %q{Gem adds class methods to create readable, writable and accessible constants.}
  gem.summary       = %q{Gem adds class methods to create readable, writable and accessible constants.}
  gem.homepage      = "https://github.com/bkr/easy_class_constants"
  
  gem.add_dependency('rails', '> 0')
  gem.add_development_dependency('mocha', '> 0')
  gem.add_development_dependency('shoulda', "> 0")

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "easy_class_constants"
  gem.require_paths = ["lib"]
  gem.version       = EasyClassConstants::VERSION
end
