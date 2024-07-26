class CreateEmbeddings < ActiveRecord::Migration[6.1]
  def change
    create_table :embeddings do |t|
      t.text :text
      t.binary :embedding
      t.timestamps
    end
  end
end
