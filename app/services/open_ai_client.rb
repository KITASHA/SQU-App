require 'httparty'

class OpenAiClient
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def initialize
    @headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}"
    }
  end

  def generate_response(prompt)
    options = {
      body: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        max_tokens: 150
      }.to_json,
      headers: @headers
    }

    response = self.class.post("/chat/completions", options)
    response.parsed_response
  end
end

