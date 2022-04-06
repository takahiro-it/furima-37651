class Order < ApplicationRecord
  has_many :products
  belongs_to :user
  has_one :customer
end

