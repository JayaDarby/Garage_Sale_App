class AddUserToGarageSales < ActiveRecord::Migration
  def change
    add_reference :garage_sales, :user, index: true, foreign_key: true
  end
end
