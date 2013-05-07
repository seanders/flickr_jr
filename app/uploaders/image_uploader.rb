class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process :resize_to_fit => [200,200]

  # def identifier!
  #   self.image.identifier
  # end
  # def store_dir
  #   "../uploads"
  # end
end
