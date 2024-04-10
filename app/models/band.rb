class Band < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :song_part

end
