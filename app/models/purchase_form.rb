class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :addres, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :addres
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number, format: { with:/\A\d{10,11}\z/ }
  end
    validates :phone_number, numericality: { only_integer: true }


  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)

    Purchase.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, addres: addres, building_name: building_name, phone_number: phone_number, purchase_management_id: purchase_management.id)
  end

end
