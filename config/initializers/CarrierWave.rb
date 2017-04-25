CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Settings.AWS[:aws_access_key_id],
      :aws_secret_access_key  => Settings.AWS[:aws_secret_access_key],
      :region                 => 'ap-northeast-1',
      :path_style             => true,
  }
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  case Rails.env
    when 'production'
      config.fog_directory = 'chatspace.bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/example.com'
    when 'staging'
      config.fog_directory = 'chatspace.bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/stg.example.com'
    when 'development'
      config.fog_directory = 'chatspace.bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.example.com'
    when 'test'
      config.fog_directory = 'chatspace.bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.example.com'
  end
end