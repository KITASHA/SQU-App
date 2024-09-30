class ChatsController < ApplicationController
  before_action :basic_auth

  def create
    client = OpenAiClient.new

    # ユーザーの質問からエンベディングを生成
    user_prompt = params[:prompt]
    user_embedding = client.generate_embedding(user_prompt)

    if user_embedding.nil?
      render json: { error: "エンベディングの生成に失敗しました。" }, status: :unprocessable_entity
      return
    end

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
    # 引数が配列であることを確認
    unless vec1.is_a?(Array) && vec2.is_a?(Array)
      raise ArgumentError, 'Both arguments must be arrays'
    end

    # ベクトルが数値の配列であることを確認
    unless vec1.all? { |v| v.is_a?(Numeric) } && vec2.all? { |v| v.is_a?(Numeric) }
      raise ArgumentError, 'Vectors must contain only numeric values'
    end
    
    # ベクトルの次元が一致することを確認
    if vec1.size != vec2.size
      raise ArgumentError, "Vectors must be of the same dimension (#{vec1.size} != #{vec2.size})"
    end
    
    # ドット積の計算
    dot_product = vec1.zip(vec2).map { |x, y| x * y }.sum
    
    # 各ベクトルの大きさを計算
    magnitude1 = Math.sqrt(vec1.sum { |x| x**2 })
    magnitude2 = Math.sqrt(vec2.sum { |x| x**2 })
    
    # ゼロ除算のチェック
    return 0 if magnitude1.zero? || magnitude2.zero?

    # コサイン類似度の計算
    dot_product / (magnitude1 * magnitude2)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end
end
