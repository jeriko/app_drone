# -*- encoding: utf-8 -*-
require File.expand_path('../lib/app_drone/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Daniel Davey"]
  gem.email         = ["whoisdanieldavey@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "app_drone"
  gem.require_paths = ["lib"]
  gem.version       = AppDrone::VERSION
end
