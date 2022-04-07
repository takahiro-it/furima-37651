class Order < ApplicationRecord
  belongs_to :products
  belongs_to :user
  has_one :customer
end

