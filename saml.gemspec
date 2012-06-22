# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "saml/version"

development_files = %w(.gitignore Guardfile Gemfile)

Gem::Specification.new do |s|
  s.name        = "saml"
  s.version     = SAML::VERSION
  s.author      = "Kjell-Magne Øierud"
  s.email       = ["kjellm@oierud.net"]
  s.homepage    = "https://github.com/kjellm/skeleton"
  s.license     = "MIT"
  s.summary     = %q{Partial implementation of the SAML Standard}
  s.description = %q{Partial implementation of the SAML Standard}
  
  s.files         = `git ls-files`.split("\n") - development_files
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 1.8.7'

  s.add_runtime_dependency "uuid"
  s.add_runtime_dependency "xml_signature"
end
