class Band < ApplicationRecord
  extend FriendlyId
  friendly_id :band_name, use: :slugged

  has_one_attached :image
  belongs_to :user
  validates :band_name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  has_many :gig_bands
  has_many :gigs, through: :gig_bands
end
