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
        first_five = digest[0..4]
        # make the API call
        results = HTTParty.get("https://api.pwnedpasswords.com/range/#{first_five}")

        # guard: if we dont get something back
        return unless results.code == 200

        # split the string based on line breaks into an array
        res_array = results.split("\n")
        # interate through the list of hashes
        res_array.each do |partial_hash|
          # hashes are formatted hash:count
          # ex. 0018A45C4D1DEF81644B54AB7F969B88D65:1
          # return true if we find a match
          return true if "#{first_five}#{partial_hash.split(":")[0]}".upcase == digest.upcase
        end

        # return false if we dont find anything
        return false
      end
    end
  end
end

# Uncomment and call directly if you want to test this locally
# results = HaveIBeenPwned::pwned 'abc123'
# puts results
