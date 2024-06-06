class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
