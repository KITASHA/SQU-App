class HomesController < ApplicationController
  def index
  end

  # SQUEAR概要説明ページ
  def about
  end

  # 定期活動会についての詳細ページ
  def show_1 
  end

  # Okayama Music SQUAREについての詳細ページ
  def swow_2
    # `selected` が true のリリースを取得
    @selected_release = Release.find_by(selected: true)
  end

  # スターターバンド・アシスト制度についての詳細ページ
  def swow_3
  end

  #設定ページ
  def option
  end

end
