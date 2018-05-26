$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "awesome_backup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "awesome_backup"
  s.version     = AwesomeBackup::VERSION
  s.authors     = ["kaspernj"]
  s.email       = ["kaspernj@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AwesomeBackup."
  s.description = "TODO: Description of AwesomeBackup."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "sqlite3"
end
