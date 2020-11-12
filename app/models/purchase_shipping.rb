class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :drawing_id, :postal_code, :prefecture, :city, :address, :building, :phone_number, :purchase_id 

  
end