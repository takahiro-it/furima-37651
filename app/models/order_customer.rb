class OrderCustomer 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price, :orders_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid."}
    validates :token, presence: true
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
      Customer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end


