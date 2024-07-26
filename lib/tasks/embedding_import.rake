namespace :embedding do
  desc "Import embeddings from file"
  task import: :environment do
    require 'fileutils'
    require_relative '../../lib/embedding_generator'

    generator = EmbeddingGenerator.new(ENV['OPENAI_API_KEY'])
    
    file_path = 'lib/embeddings/square_embedding.pkl'
    
    if File.exist?(file_path)
      embedding_data = File.open(file_path, 'rb') { |f| Marshal.load(f) }
      
      Embedding.create(text: "SQUARE アカペラサークル\n\nコンセプト...", embedding: embedding_data)
      
      puts "Embeddings imported successfully!"
    else
      puts "File not found: #{file_path}"
    end
  end
end
