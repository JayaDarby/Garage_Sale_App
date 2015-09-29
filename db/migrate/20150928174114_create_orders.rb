class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :shipping
      t.string :order_status

      t.timestamps null: false
    end
  end
end

