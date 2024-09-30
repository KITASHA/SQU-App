require_relative '../open_ai_client'

namespace :embedding do
  desc 'Generate embeddings for text data'
  task generate: :environment do
    client = OpenAiClient.new

    file_path = Rails.root.join('lib', 'text.txt') 
    File.readlines(file_path).each do |line|
      text = line.strip
      next if text.empty?

      embedding = client.generate_embedding(text)
      Embedding.create!(text: text, embedding: embedding)
    end
  end
  puts "embedding was successful!"
end
