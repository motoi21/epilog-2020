class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :drawing_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }

  def save
    purchase = Purchase.create(user_id: user_id, drawing_id: drawing_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end