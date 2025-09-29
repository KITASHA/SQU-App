class Release < ApplicationRecord
  has_one_attached :image
  validate :only_one_release, on: :create

  attr_accessor :remove_image
  before_save :purge_image_if_requested

  private

  def only_one_release
    if Release.count >= 1
      errors.add(:base, 'Only one release is allowed')
    end
  end

  def purge_image_if_requested
    image.purge if remove_image == '1'
  end
end
