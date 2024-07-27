class CreateEmbeddings < ActiveRecord::Migration[7.0]
  def change
    create_table :embeddings do |t|
      t.text :text
      t.json :embedding

      t.timestamps
    end
  end
end
