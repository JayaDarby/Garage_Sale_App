class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.decimal :star_rating

      t.timestamps null: false
    end
  end
end
