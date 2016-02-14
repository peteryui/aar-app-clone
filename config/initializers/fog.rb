# -*- encoding : utf-8 -*-
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => Figaro.env.aws_access_key,
    :aws_secret_access_key  => Figaro.env.aws_secret_access_key,
    :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'    
    :host                   => "s3.amazonaws.com",
    :endpoint               => "http://s3.amazonaws.com" , # optional, defaults to nil
    :path_style             => true


  }
  config.fog_directory  = Figaro.env.aws_s3_bucket            # required
  config.fog_public     = true                            # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
