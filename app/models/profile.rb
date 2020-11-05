class Profile < ApplicationRecord
  belongs_to :user, optional: true
  with_option presence: true do
    validates :
  end
end
