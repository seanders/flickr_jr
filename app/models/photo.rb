class Photo < ActiveRecord::Base
  include CarrierWave::MiniMagick
  mount_uploader :image, ImageUploader
  belongs_to :album, :foreign_key => "album_id"

  # after_create :generate_thumbnail

  # def generate_thumbnail
  #   image = MiniMagic::Image.open(self.image.url).resize("100x100")
  #   image = image.write("/Users/apprentice/Desktop/flickr_jr/public/thumbnails/#{self.image.identifier}")
  # end

end
