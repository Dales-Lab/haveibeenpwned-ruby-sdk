require 'httparty'
require 'digest'

module HaveIBeenPwned
  class << self
    def pwned password
      # if password is not nil
      if password
        # get a digest of the password
        digest = Digest::SHA1.hexdigest password
        # get the first 5 characters of the hash
        firstFive = digest[0..4]
        # make the API call
        results = HTTParty.get("https://api.pwnedpasswords.com/range/#{firstFive}")
        # if we get something back
        if results.code == 200
          # split the string based on line breaks into an array
          resArray = results.split("\n")
          # interate through the list of hashes
          resArray.each do |partial_hash|
            # hashes are formatted hash:count
            # ex. 0018A45C4D1DEF81644B54AB7F969B88D65:1
            # return true if we find a match
            return true if "#{firstFive}#{partial_hash.split(":")[0]}".upcase == digest.upcase
          end

          # return false if we dont find anything
          return false
        else
          raise 'Troy Hunt has failed us. The API returned something not 200.'
        end
      end
    end
  end
end

# Uncomment and call directly if you want to test this locally
# results = HaveIBeenPwned::pwned 'abc123'
# puts results
