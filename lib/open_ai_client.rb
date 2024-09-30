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

  # チャット応答を生成するメソッド
  def generate_response(prompt)
    return { error: "Prompt is missing." } if prompt.nil? || prompt.empty?

    options = {
      body: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        max_tokens: 150
      }.to_json,
      headers: @headers
    }

    response = self.class.post("/chat/completions", options)

    if response.success?
      response.parsed_response
    else
      { error: response.parsed_response['error']['message'] }
    end
  end

  # エンベディングを生成するメソッド
  def generate_embedding(text)
    return { error: "Text is missing." } if text.nil? || text.empty?

    options = {
      body: {
        model: "text-embedding-ada-002",
        input: text
      }.to_json,
      headers: @headers
    }

    response = self.class.post("/embeddings", options)

    if response.success?
      response.parsed_response['data'].first['embedding']
    else
      { error: response.parsed_response['error']['message'] }
    end
  end
  
  # コンテキスト付きの応答を生成するメソッド
  def generate_response_with_context(prompt, context)
    return { error: "Prompt or context is missing." } if prompt.nil? || prompt.empty? || context.nil? || context.empty?

    options = {
      body: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are a helpful assistant." },
          { role: "user", content: context },
          { role: "user", content: prompt }
        ],
        max_tokens: 150
      }.to_json,
      headers: @headers
    }

    response = self.class.post("/chat/completions", options)

    if response.success?
      response.parsed_response
    else
      { error: response.parsed_response['error']['message'] }
    end
  end
end
