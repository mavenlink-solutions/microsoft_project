require File.join(File.dirname(__FILE__), "lib/microsoft_project/version")

Gem::Specification.new do |s|
  s.name    = "microsoft_project"
  s.version = MicrosoftProject::VERSION
  s.date    = "2019-11-06"
  s.summary = "Microsoft project classes with support for serialization and deserialization"
  s.authors = ["Mavenlink"]
  s.email   = ["opensource@mavenlink.com"]
  s.files   = ["Gemfile", "lib/**/*.rb"]
  s.license = "MIT"

  s.add_dependency "activesupport", ">= 2.3.3"
  s.add_dependency "nokogiri", "~> 1.10"
  s.add_development_dependency "rspec", "~> 3"
  s.add_development_dependency "rubocop", "~> 0.74"
end
