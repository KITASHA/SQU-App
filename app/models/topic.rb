class Topic < ApplicationRecord
  validates :date, presence: true
  validates :news, presence: true, length: { maximum: 50, message: "は50文字以内で入力してください。" }
end
