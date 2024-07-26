class EmbeddingsController < ApplicationController
  def show
    query_text = params[:query]
    query_embedding = generate_embedding(query_text)
    
    embeddings = Embedding.all
    most_similar = embeddings.max_by do |embedding_record|
      cosine_similarity(query_embedding, embedding_record.embedding)
    end

    render json: { result: most_similar.text }
  end

  private

  def generate_embedding(text)
    generator = EmbeddingGenerator.new(ENV['OPENAI_API_KEY'])
    generator.generate_embedding(text)
  end
  
  def cosine_similarity(a, b)
    a_vector = Vector.elements(a)
    b_vector = Vector.elements(b)
    a_vector.inner_product(b_vector) / (a_vector.magnitude * b_vector.magnitude)
  end
end