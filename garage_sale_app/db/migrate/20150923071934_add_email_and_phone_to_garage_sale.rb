class AddEmailAndPhoneToGarageSale < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :phone_number, :bigint
  	add_column :garage_sales, :email, :string
  	add_column :garage_sales, :can_text, :boolean
  	add_column :garage_sales, :can_call, :boolean
  	add_column :garage_sales, :can_email, :boolean
  end
end
