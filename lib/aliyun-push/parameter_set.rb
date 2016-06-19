require 'cgi'
require 'openssl'
require 'base64'
require 'time'

module AliyunPush
  class AliyunPush::ParameterSet
    def initialize
      @params = {}
    end

    def add(key, value)
      @params[key] = value
    end

    def concatenate
      @params.sort_by{ |key, value| key }.to_h.map do |key, value|
        "#{custom_url_encode(key)}=#{custom_url_encode(value)}"
      end.join '&'
    end

    def string_to_sign
      "GET&%2F&#{CGI.escape(concatenate)}"
    end

    def sign(access_key_secret)
      Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), access_key_secret + '&', string_to_sign)).strip
    end

    private

    def custom_url_encode(str)
      CGI.escape(str).sub('+', '%20').sub('*', '%2A').sub('%7E', '~')
    end
  end
end
