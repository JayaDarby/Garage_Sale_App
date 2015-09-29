class CreateDurationTimes < ActiveRecord::Migration
  def change
    create_table :duration_times do |t|
      t.time :start_time
      t.time :end_time
      t.date :date
      t.timestamp :dateTime

      t.timestamps null: false
    end
  end
end
