class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy, :toggle_selected]

  def index
    if Release.exists?
      # 最初のレコードがあればその詳細画面へリダイレクト
      redirect_to release_path(Release.first)
    else
      # レコードがない場合は新規作成画面にリダイレクト
      redirect_to new_release_path
    end
  end

  def new
    @release = Release.new
  end

  def create
    # 新しいリリースを作成
    @release = Release.new(release_params)
    @release.selected = true # 新しく作成されたリリースを選択状態にする
  
    if @release.save
      redirect_to @release, notice: "リリースが作成されました。"
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    @release = Release.find(params[:id])  # これが通常のやり方です
    if @release.update(release_params)
      redirect_to releases_path, notice: 'リリースが更新されました。'
    else
      render :edit
    end
    Release.where(selected: true).update_all(selected: false)

    # 選択されたリリースのselectedをtrueに変更する
    @release.update(selected: true)

  end  

  def toggle_selected
    @release.update(selected: !@release.selected)
    redirect_to @release, notice: "リリースの表示状態が変更されました。"
  end

  def destroy
    @release.destroy
    redirect_to  releases_path, notice: 'リリースが削除されました。'
  end

  private

  def release_params
    params.require(:release).permit(:title, :body, :image, :form_url, :selected)
  end
  def set_release
    @release = Release.find(params[:id])
  end
end
