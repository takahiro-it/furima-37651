class OrderCustomer < ApplicationRecord
  include ActiveModel::Model
  atter_accessor :カラム名
  
  validates
  
  def save
    Order.create(カラム名
    Customer.create(カラム名

end
