class ChatsController < ApplicationController
  before_action :basic_auth

  def create
    client = OpenAiClient.new

    # ユーザーの質問からエンベディングを生成
    user_prompt = params[:prompt]
    user_embedding = client.generate_embedding(user_prompt)

    # データベースから全てのエンベディングを取得
    embeddings = Embedding.all

    # 最も関連性の高いエンベディングを探す
    best_match = embeddings.max_by do |embedding|
      cosine_similarity(user_embedding, embedding.embedding)
    end

    # 最も関連性の高い情報を取得
    best_match_text = best_match&.text || "関連する情報が見つかりませんでした。"

    # OpenAI APIを使って応答を生成
    response = client.generate_response_with_context(user_prompt, best_match_text)

    # レスポンスをログに記録（デバッグ用）
    Rails.logger.info "OpenAI Response: #{response}"

    render json: { response: response }
  end

  private

  # コサイン類似度を計算するメソッド
  def cosine_similarity(vec1, vec2)
    dot_product = vec1.zip(vec2).map { |x, y| x * y }.reduce(:+)
    magnitude1 = Math.sqrt(vec1.map { |x| x**2 }.reduce(:+))
    magnitude2 = Math.sqrt(vec2.map { |x| x**2 }.reduce(:+))
    dot_product / (magnitude1 * magnitude2)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end
end
