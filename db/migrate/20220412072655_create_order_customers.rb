class CreateOrderCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :order_customers do |t|

      t.timestamps
    end
  end
end
