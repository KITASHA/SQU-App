class Gig < ApplicationRecord
  validates :gig_name, presence: true, length: { maximum: 50 }
  has_many :gig_bands, dependent: :destroy
  has_many :bands, through: :gig_bands
  belongs_to :user
  has_one_attached :image 
end
