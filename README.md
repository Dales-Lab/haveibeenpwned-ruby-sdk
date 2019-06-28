# haveibeenpwned-ruby-sdk
Ruby wrapper for V2 haveibeenpwned.com API.

[![Build Status](https://travis-ci.org/Dales-Lab/haveibeenpwned-ruby-sdk.svg?branch=master)](https://travis-ci.org/Dales-Lab/haveibeenpwned-ruby-sdk) [![codecov](https://codecov.io/gh/Dales-Lab/haveibeenpwned-ruby-sdk/branch/master/graph/badge.svg)](https://codecov.io/gh/Dales-Lab/haveibeenpwned-ruby-sdk)

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
result = HaveIBeenPwned::pwned 'abc123'
```

#### Rails
```
# Gemfile
gem 'have-i-been-pwned'
```

```
# some controller
# check the password
if HaveIBeenPwned::pwned params[:password]
   puts "Yay! You can use this password!"
else
   puts "No! Bad!!"
end
```

## Contributing
- Open an issue about your change
- Fork it, DL it
- Run `bundle`
- Run `rake test`
- Make your additions, changes, fixes, etc. (Do not make changes to version, Rakefile or spec
- Add tests for the above (no pr acceptance without them)
- Run `rake test`
- Make your PR. :smile:
