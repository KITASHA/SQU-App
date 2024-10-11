class ChangeNewsLimitInTopics < ActiveRecord::Migration[7.0]
  def change
    change_column :topics, :news, :string, limit: 50
  end
end
