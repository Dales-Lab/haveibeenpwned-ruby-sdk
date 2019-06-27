Gem::Specification.new do |s|
  s.name = 'have_i_been_pwned'
  s.version = "0.1.0"
  s.date = '2019-06-27'
  s.summary = 'Check to see if your passwords are safe'
  s.description = 'A simple gem to check and see if a given password was compromised by a hack. Special thanks to Troy Hunt facilitating the service.'
  s.authors = ["Dale Myszewski"]
  s.email = 'dale@daleslab.com'
  s.files = [
    "Gemfile",
    "Rakefile",
    "VERSION",
    "lib/have_i_been_pwned.rb",
    "test/test_have_i_been_pwned.rb"
  ]
  s.require_paths = ["lib", "test"]

  s.add_runtime_dependency "httparty"

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
end
