class Photo < ApplicationRecord
  belongs_to :building
  mount_uploader :image, PhotoUploader
end
