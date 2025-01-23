class Release < ApplicationRecord
  has_one_attached :image
  validate :only_one_release, on: :create

  private

  def only_one_release
    if Release.count >= 1
      errors.add(:base, 'Only one release is allowed')
    end
  end
end
