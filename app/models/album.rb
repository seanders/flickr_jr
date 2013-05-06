class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  mount_uploader :photo, PhotoUploader
end
