class Gig < ApplicationRecord
  validates :gig_name, presence: true, length: { maximum: 50 }  # バリデーションを維持
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true

  has_many :gig_bands, dependent: :destroy
  has_many :bands, through: :gig_bands
  has_one_attached :image
end
