class CreateGarageDateTimes < ActiveRecord::Migration
  def change
    create_table :garage_date_times do |t|
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
  end
end
