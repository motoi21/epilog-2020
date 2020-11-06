class Profile < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :category

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :genre_id
  end
end
