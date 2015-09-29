class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.decimal :price
      t.text :images, array: true, default: []

      t.timestamps null: false
    end
  end
end
