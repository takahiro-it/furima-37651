class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :shopping_day
  belongs_to_active_hash :shopping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status

  belongs_to :user
  has_one    :item
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :category_id
  validates :shopping_cost_id
  validates :status_id
  validates :prefecture_id
  validates :shopping_day_id
  validates :price
  end

  with_options numericality: { other_than: 0, message: 'select' } do
  validates :category_id
  validates :shopping_day_id
  validates :shopping_cost_id
  validates :prefecture_id
  validates :status_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' }, inclusion: { in: (300..9_999_999), message: 'Out of setting range' }
end

