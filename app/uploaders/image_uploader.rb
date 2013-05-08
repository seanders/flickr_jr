class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process :resize_to_fit => [300,300]

  version :thumb do
    process :resize_to_fill => [100,100]
  end
end
