require 'httparty'
require 'digest'

module HaveIBeenPwned
  class << self
    # Check to see if a given password has been pwned/compromised by a breach.
    # @param [String] password The *password* you want to check.
    # @return [Boolean] True if the password has been compromised, false otherwise
    def pwned password
      # if password is not nil
      if password
        # get a digest of the password
        digest = Digest::SHA1.hexdigest password
        # make sure we nil the password
        password = nil
        # get the first 5 characters of the hash
        first_five = digest[0..4]
        # make the API call
        results = HTTParty.get("https://api.pwnedpasswords.com/range/#{first_five}")

        # guard: if we dont get something back
        return false unless results.code == 200

        # split the string based on line breaks into an array
        res_array = results.split("\n")
        # interate through the list of hashes
        res_array.each do |partial_hash|
          # hashes are formatted hash:count
          # ex. 0018A45C4D1DEF81644B54AB7F969B88D65:1
          # return true if we find a match
          return true if "#{first_five}#{partial_hash.split(':')[0]}".upcase == digest.upcase
        end

        # return false if we dont find anything
        return false
      end
    end

    # Check to see if the given *account* was involved in a data breach
    # @param [String] email The email address you want to check
    # @param [String] api_key The v3 API required a paid key from haveibeenpwned.com. Can also be specified as a ENV VAR 'HIBP_API_KEY' {More Information}[https://www.troyhunt.com/authentication-and-the-have-i-been-pwned-api/]
    # @param [String] user_agent Provide a custom user agent. (default: haveibeenpwned-ruby-sdk)
    # @return [[Hash], nil] Returns a array of hashes containing the [:name] of places the email was compromised by.
    def pwned_account email, api_key = nil, user_agent = 'haveibeenpwned-ruby-sdk'
      api_key ||= ENV['HIBP_API_KEY'] # for testing
      throw 'You must provide a paid API key from haveibeenpwned.com to use this feature.' if api_key.nil?
      headers = {
        'user-agent' => user_agent,
        'Hibp-Api-Key' => api_key
      }
      results = HTTParty.get("https://haveibeenpwned.com/api/v3/breachedaccount/#{email}", headers: headers)
      return if results.nil?
      error_check = Hash[results.map { |(k, v)| [k.downcase.to_sym, v] }] rescue nil

      if !error_check
        results.map! { |item| Hash[item.map { |(k, v)| [k.downcase.to_sym, v] }] }
        results
      else
        throw error_check[:message]
      end
    end
  end
end

# Uncomment and call directly if you want to test this locally
# results = HaveIBeenPwned::pwned 'abc123'
# puts results

# results = HaveIBeenPwned.pwned_account('dale@daleslab.com', 'not_a_valid_api_key')
# results.each do |result|
#   puts result[:name]
# end
