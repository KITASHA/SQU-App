class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :date, null: false
      t.time :start_time
      t.string :location

      t.timestamps
    end
  end
end
