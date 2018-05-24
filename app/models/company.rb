class Company < ApplicationRecord
  belongs_to :user
  mount_uploader :logo, PhotoUploader
  mount_uploader :banner, PhotoUploader
end
