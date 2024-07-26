require_relative '../../config/environment'
require_relative '../../lib/embedding_generator'

class EmbeddingImporter
  def self.import
    # データベースから保存されたエンベディングファイルを読み込み
    embedding_data = File.open('lib/embeddings/square_embedding.pkl', 'rb') { |f| Marshal.load(f) }

    # データベースに保存
    Embedding.create(text: "SQUARE アカペラサークルの説明文", embedding: embedding_data)

    puts "Embedding imported to database successfully!"
  end
end

EmbeddingImporter.import
