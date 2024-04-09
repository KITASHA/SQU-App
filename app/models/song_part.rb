class SongPart < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'Lead' },
    { id: 2, name: '1st' },
    { id: 3, name: '2ed' },
    { id: 4, name: '3rd' },
    { id: 5, name: 'Bass' },
    { id: 6, name: 'V.P.' },
]

include ActiveHash::Associations
has_many :parts
has_many :bands

end