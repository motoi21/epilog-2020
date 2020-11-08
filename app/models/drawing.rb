class Drawing < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :genre
  belongs_to_active_hash :shipping_method

  with_options presence: true do
    validates :image
    validates :title
    validates :production_date
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :genre_id
  end
end
