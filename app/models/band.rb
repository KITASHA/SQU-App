class Band < ApplicationRecord
  extend FriendlyId
  friendly_id :band_name, use: :slugged

  def should_generate_new_friendly_id?
    band_name_changed? || slug.blank?
  end

  has_one_attached :image
  validates :band_name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  has_many :gig_bands
  has_many :gigs, through: :gig_bands

end
