require 'httparty'

class EmbeddingGenerator
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def initialize(api_key)
    @headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{api_key}"
    }
  end

  def generate_embedding(text)
    options = {
      body: {
        model: "text-embedding-ada-002",
        input: text
      }.to_json,
      headers: @headers
    }

    response = self.class.post("/embeddings", options)
    response.parsed_response["data"][0]["embedding"]
  end
end
