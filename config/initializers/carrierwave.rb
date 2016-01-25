CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_KEY"],               # required
    aws_secret_access_key: ENV["AWS_SECRET"],            # required
    region:                'Oregon',                     # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV["S3_UPLOAD_BUCKET"]        # required
  config.fog_attributes = {                              # optional, defaults to {}
    'Cache-Control' => "max-age=#{365.days.to_i}"
  }
end
