class ShippingMethod < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'JPG' },
    { id: 3, name: 'PNG' },
    { id: 4, name: 'PSD(Photoshop)' },
    { id: 5, name: 'AI(Illustrator)' },
    { id: 6, name: '郵送' }
  ]
end
include ActiveHash::Associations
has_many :drawings