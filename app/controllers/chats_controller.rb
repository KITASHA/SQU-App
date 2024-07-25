class ChatsController < ApplicationController
  def index
  end

  def create
    client = OpenAIClient.new
    response = client.generate_response(params[:prompt])

    # レスポンスをログに記録（デバッグ用）
    Rails.logger.info "OpenAI Response: #{response}"

    render json: { response: response }
  end
end
