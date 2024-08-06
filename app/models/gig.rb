class Gig < ApplicationRecord
  has_many :gig_bands
  has_many :bands, through: :gig_bands
  belongs_to :user
  has_one_attached :image 
end
