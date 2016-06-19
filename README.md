# aliyun-push-ruby-sdk

Ruby wrapper of Aliyun push service.
I'm using it in production, and it works well.

## Installation

Add `gem 'aliyun-push'` to your application's Gemfile:

    gem 'aliyun-push'
    
And then run:

    $ bundle install
    
Or install it with gem command:

    $ gem install aliyun-push
    
## Usage

Example:

```ruby
require 'aliyun-push'

client = AliyunPush::Client.new('your_access_key_id', 'your_access_key_secret')
puts client.send_request(Action: 'Push',
  AppKey: 'your app key',
  Body: 'test',
  Summary: 'test2',
  DeviceType: '3',
  Target: 'account',
  TargetValue: '16',
  ApnsEnv: 'PRODUCT',
  StoreOffline: false,
  Type: '1',
  Title: 'test1',
  Remind: false)

# documentation for the parameterss: https://help.aliyun.com/document_detail/30074.html
```

You can create/fetch `access key` and `secret` at [https://i.aliyun.com/access_key](https://i.aliyun.com/access_key)

## Contributing

1. Fork it ( https://github.com/qinix/aliyun-push-ruby-sdk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Author

* [Eric Zhang](https://github.com/qinix)
