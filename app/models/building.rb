class Building < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :set_slug

  # after_validation :geocode

  def to_param
    slug
  end

  def update_slug
    set_slug
  end

  private

  def set_slug
    self.update(slug: to_slug)
  end
end
