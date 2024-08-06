class Gig < ApplicationRecord
  has_many :gig_bands
  has_many :bands, through: :gig_bands
end
