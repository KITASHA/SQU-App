class Event < ApplicationRecord
    validates :date, presence: true
    validates :start_time, presence: true
    validates :location, presence: true
end
