CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      region: ENV['S3_region']
    }

    case Rails.env
      when 'production'
        config.fog_directory = ENV['test_bucket_name']
        config.asset_host = ENV['test_asset_host']

      when 'development'
        config.fog_directory = ENV['dev_bucket_name']
        config.asset_host = ENV['dev_asset_host']
    end
  else
    config.storage :file
  end
end
