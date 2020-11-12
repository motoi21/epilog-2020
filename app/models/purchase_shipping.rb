class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :drawing_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number 

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
end

  