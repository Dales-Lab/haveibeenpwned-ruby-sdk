# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name = 'have-i-been-pwned'
  s.version = HaveIBeenPwned::VERSION # see: lib/version.rb
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.date = '2019-06-27'
  s.summary = 'Check to see if your passwords are safe'
  s.description = 'A simple gem to check and see if a given password was compromised by a hack. Special thanks to Troy Hunt for facilitating haveibeenpwned.'
  s.authors = ['Dale Myszewski']
  s.email = 'dale@daleslab.com'
  s.homepage = 'https://github.com/Dales-Lab/haveibeenpwned-ruby-sdk'

  s.required_ruby_version = '>= 2.3.1'

  s.add_runtime_dependency "httparty"

  s.add_development_dependency "simplecov"
  s.add_development_dependency "codecov", ">= 0.1.10"
  s.add_development_dependency "rake"
  s.add_development_dependency "mocha"
  s.add_development_dependency "test-unit"

  all_files = `git ls-files`.split("\n")
  test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.files         = all_files - test_files
  s.executables   = `git ls-files -- {bin}/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
end
