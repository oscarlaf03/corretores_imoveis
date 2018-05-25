class Company < ApplicationRecord
  mount_uploader :logo, PhotoUploader
  mount_uploader :banner, PhotoUploader
end
