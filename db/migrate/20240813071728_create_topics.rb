class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.date :date, null: false
      t.string :news, null: false, limit: 50

      t.timestamps
    end
  end
end
