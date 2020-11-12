class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :drawing
  has_one :shipping
end
