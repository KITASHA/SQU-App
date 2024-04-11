class SongPart < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'Lead' },
    { id: 2, name: 'top' },
    { id: 3, name: 'second' },
    { id: 4, name: 'third' },
    { id: 5, name: 'Bass' },
    { id: 6, name: 'percussion' },
]

include ActiveHash::Associations
has_many :parts
has_many :bands

end