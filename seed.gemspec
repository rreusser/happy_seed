$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s| 
  s.name        = "seed"
  s.version     = Seed::VERSION
  s.authors     = ["Ricky Reusser"]
  s.email       = ["ricky@happyfuncorp.com"]
  s.homepage    = "http://happyfuncorp.com"
  s.summary     = "Seed is a gem to DRY up developers!"
  s.description = "Seed is a collection of tools that gets your app started and prevents you from reinventing the wheel every time you start a project."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 3.2.12"
end
