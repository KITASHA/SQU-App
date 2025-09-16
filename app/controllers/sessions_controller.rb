class SessionsController < ApplicationController
  # ログインページを表示
  def new
  end

  def create
    if params[:password] == "1101"
      session[:authenticated] = true  # 認証成功時にセッションにフラグを保存
      redirect_to root_path, notice: "アクセスが許可されました。"
    else
      flash.now[:alert] = "無効なパスワードです。もう一度試してください。"
      render :new # ログインページに戻る
    end
  end

  # ログアウト処理
  def destroy
    session[:authenticated] = nil  # セッションから認証フラグを削除
    redirect_to root_path, notice: "ログアウトしました。"
  end
end


