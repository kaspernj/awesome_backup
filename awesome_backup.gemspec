$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "awesome_backup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "awesome_backup"
  s.version     = AwesomeBackup::VERSION
  s.authors     = ["kaspernj"]
  s.email       = ["kaspernj@gmail.com"]
  s.homepage    = "https://github.com/kaspernj/awesome_backup"
  s.summary     = "Make backups of your stuff in a simple way."
  s.description = "Make backups of your stuff in a simple way."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.2.0"
  s.add_dependency "service_pattern", ">= 0.0.3"

  s.add_development_dependency "best_practice_project"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "pg"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rubocop"
end
