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

  unless self.where(price: nil)
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :genre_id
  end
end
