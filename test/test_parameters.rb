require 'minitest/autorun'
require 'aliyun-push'

class ParametersTest < Minitest::Test
  def test_parameters
    ps = AliyunPush::ParameterSet.new
    ps.add 'Format', 'XML'
    ps.add 'AccessKeyId', 'testid'
    ps.add 'Action', 'GetDeviceInfos'
    ps.add 'SignatureMethod', 'HMAC-SHA1'
    ps.add 'RegionId', 'cn-hangzhou'
    ps.add 'Devices', 'e2ba19de97604f55b165576736477b74,92a1da34bdfd4c9692714917ce22d53d'
    ps.add 'SignatureNonce', 'c4f5f0de-b3ff-4528-8a89-fa478bda8d80'
    ps.add 'SignatureVersion', '1.0'
    ps.add 'Version', '2015-08-27'
    ps.add 'AppKey', '23267207'
    ps.add 'Timestamp', '2016-03-29T03:59:24Z'

    assert_equal 'GET&%2F&AccessKeyId%3Dtestid%26Action%3DGetDeviceInfos%26AppKey%3D23267207%26Devices%3De2ba19de97604f55b165576736477b74%252C92a1da34bdfd4c9692714917ce22d53d%26Format%3DXML%26RegionId%3Dcn-hangzhou%26SignatureMethod%3DHMAC-SHA1%26SignatureNonce%3Dc4f5f0de-b3ff-4528-8a89-fa478bda8d80%26SignatureVersion%3D1.0%26Timestamp%3D2016-03-29T03%253A59%253A24Z%26Version%3D2015-08-27',
      ps.string_to_sign

    assert_equal 'Q4jj5vC+NRtz294V+oIW7gfaJ6U=',
      ps.sign('testsecret')
  end
end
