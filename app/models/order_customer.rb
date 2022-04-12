class OrderCustomer < ApplicationRecord
  include ActiveModel::Model
  atter_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price, :user_id, :item_id

  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
  end
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Customer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end


