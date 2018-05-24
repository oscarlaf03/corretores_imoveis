class Building < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address
end
