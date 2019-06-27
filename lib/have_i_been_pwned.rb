require 'httparty'
require 'digest'

module HaveIBeenPwned
  class << self
    def pwned password
      if password
        digest = Digest::SHA1.hexdigest password
        firstFive = digest[0..4]
        results = HTTParty.get("https://api.pwnedpasswords.com/range/#{firstFive}")
        if results.code != 404
          resArray = results.split("\n")
          resArray.each do |partial_hash|
            return true if "#{firstFive}#{partial_hash.split(":")[0]}".upcase == digest.upcase
          end
          return false
        else
          raise 'Troy Hunt has failed us. The API returned a 404.'
        end
      else
        raise 'You must provide a password to check!'
      end
    end
  end
end

# Uncomment and call directly if you want to test this locally
# results = HaveIBeenPwned::pwned 'abc123'
# puts results
