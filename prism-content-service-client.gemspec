# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "prism-content-service-client"
  s.version = "0.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andy Vanasse"]
  s.date = "2012-07-24"
  s.description = "An ActiveRecord-like interface for reading the ContentService API."
  s.email = "andyvanasse@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/prism-content-service-client.rb",
    "lib/prism-content-service-client/anniversary.rb",
    "lib/prism-content-service-client/anniversary_persistence.rb",
    "lib/prism-content-service-client/announcement.rb",
    "lib/prism-content-service-client/announcement_persistence.rb",
    "lib/prism-content-service-client/birthday.rb",
    "lib/prism-content-service-client/birthday_persistence.rb",
    "lib/prism-content-service-client/config.rb",
    "lib/prism-content-service-client/event.rb",
    "lib/prism-content-service-client/event_persistence.rb",
    "lib/prism-content-service-client/photo.rb",
    "lib/prism-content-service-client/photo_persistence.rb",
    "lib/support/serializers.rb",
    "lib/support/validation.rb",
    "prism-content-service-client.gemspec",
    "spec/prism-content-service-client_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/arvanasse/prism-content-service-client"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.17"
  s.summary = "An ActiveRecord-like interface for reading the ContentService API."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<typhoeus>, ["~> 0.3.3"])
      s.add_runtime_dependency(%q<activesupport>, ["> 2.3.5"])
      s.add_runtime_dependency(%q<json>, ["~> 1.6.6"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1.3"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<typhoeus>, ["~> 0.3.3"])
      s.add_dependency(%q<activesupport>, ["> 2.3.5"])
      s.add_dependency(%q<json>, ["~> 1.6.6"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.1.3"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<typhoeus>, ["~> 0.3.3"])
    s.add_dependency(%q<activesupport>, ["> 2.3.5"])
    s.add_dependency(%q<json>, ["~> 1.6.6"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.1.3"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

