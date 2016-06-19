require 'securerandom'
require 'aliyun-push/parameter_set'
require 'httparty'

module AliyunPush
  class Client
    def initialize(access_key_id, access_key_secret, region = 'cn-hangzhou')
      @base_url = "https://cloudpush.aliyuncs.com/"
      @region = region
      @access_key_id = access_key_id
      @access_key_secret = access_key_secret
    end

    def send_request(params)
      default_params = {
        Format: 'JSON',
        RegionId: @region,
        Version: '2015-08-27',
        AccessKeyId: @access_key_id,
        SignatureMethod: 'HMAC-SHA1',
        Timestamp: Time.now.utc.iso8601,
        SignatureVersion: '1.0',
        SignatureNonce: SecureRandom.uuid
      }

      params.each do |key, val|
        default_params[key.to_sym] = val
      end

      ps = ParameterSet.new
      default_params.each do |key, val| 
        ps.add key.to_s, val.to_s
      end
      ps.add 'Signature', ps.sign(@access_key_secret)
      request_url = "#{@base_url}?#{ps.concatenate}"
      HTTParty.get request_url
    end
  end
end
