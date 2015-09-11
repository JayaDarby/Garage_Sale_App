class CreateGarageSales < ActiveRecord::Migration
  def change
    create_table :garage_sales do |t|
      t.string :address
      t.string :description
      t.text :photos, array:true, default: []
      t.timestamp :postdate
      t.text :title

      t.timestamps null: false
    end
  end
end
