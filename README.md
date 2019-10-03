# haveibeenpwned-ruby-sdk
Ruby wrapper for V2 haveibeenpwned.com API.

[![Build Status](https://travis-ci.org/Dales-Lab/haveibeenpwned-ruby-sdk.svg?branch=master)](https://travis-ci.org/Dales-Lab/haveibeenpwned-ruby-sdk) [![codecov](https://codecov.io/gh/Dales-Lab/haveibeenpwned-ruby-sdk/branch/master/graph/badge.svg)](https://codecov.io/gh/Dales-Lab/haveibeenpwned-ruby-sdk) [![Gem](https://img.shields.io/gem/v/have-i-been-pwned.svg?style=flat)](http://rubygems.org/gems/have-i-been-pwned "View this project on Rubygems")

## Installation
```
gem install have-i-been-pwned
```

## Use
#### General Use
```
require 'have-i-been-pwned'
...
# returns true if the password is found, false otherwise
result = HaveIBeenPwned.pwned 'abc123'
```

```
require 'have-i-been-pwned'
...
# returns an array with symbolized hashs of breachers (ie. [ { :name => 'Adobe' } ]) for that account, nil if none are found
result = HaveIBeenPwned.pwned_account 'some-email@gmail.com'
```

#### Rails
```
# Gemfile
gem 'have-i-been-pwned'
```

```
# some controller
# check the password
if !HaveIBeenPwned.pwned params[:password]
   puts "Yay! You can use this password!"
else
   puts "No! Bad!!"
end
```

#### Timeout

With both the pwned and pwned_account methods you can also introduce a custom timeout. By default the timeout is 30 seconds. You can customize is to your needs like so:
```
HaveIBeenPwned.pwned 'abc123', timeout: 10
```

## Contributing
- Open an issue about your change
- Fork it, DL it
- Run `bundle`
- Run `bundle exec rake`
- Make your additions, changes, fixes, etc. (Do not make changes to version, Rakefile or spec
- Add tests for the above (no pr acceptance without them)
- Run `bundle exec rake`
- Make your PR. :smile:
