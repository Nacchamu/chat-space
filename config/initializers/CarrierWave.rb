CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => AWS_ACCESS_KEY_ID,
      :aws_secret_access_key  => AWS_SECRET_ACCESS_KEY,
      :region                 => 'ap-northeast-1',
      :path_style             => true,
  }
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  case Rails.env
    when 'production'
      config.fog_directory = 'images-for-chatspace'
      config.asset_host = 'images-for-chatspace'
    when 'staging'
      config.fog_directory = 'images-for-chatspace'
      config.asset_host = 'images-for-chatspace'
    when 'development'
      config.fog_directory = 'images-for-chatspace'
      config.asset_host = 'images-for-chatspace'
    when 'test'
      config.fog_directory = 'images-for-chatspace'
      config.asset_host = 'images-for-chatspace'
  end
end
