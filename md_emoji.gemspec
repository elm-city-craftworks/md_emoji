$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "md_emoji/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "md_emoji"
  s.version     = MdEmoji::VERSION
  s.authors     = ["Jordan Byron"]
  s.email       = ["jordan@ducksoupsoftware.com"]
  s.homepage    = "https://github.com/mendicant-original/md_emoji"
  s.summary     = "Markdown emoji for Rails"
  s.description = "Rails gem which adds emoji parsing to markdown"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] +
    %w{Rakefile README.markdown LICENSE}
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties",  ">= 3.1.0"
  s.add_dependency "redcarpet", ">= 2.0"

  s.add_development_dependency "rails", ">= 3.1.0"
end
