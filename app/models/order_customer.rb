class OrderCustomer < ApplicationRecord
  include ActiveModel::Model
  atter_accessor :post_code, :prefecture, :city, :address, :building_name, :price, :user_id
  
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end
  
  def save
    Order.create(カラム名
    Customer.create(カラム名

end
