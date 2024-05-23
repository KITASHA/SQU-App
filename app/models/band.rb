class Band < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :band_name, presence: true
  validates :description, presence: true
end
