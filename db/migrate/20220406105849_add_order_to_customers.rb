class AddOrderToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :order, null: false, foreign_key: true
  end
end
