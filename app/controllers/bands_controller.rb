class BandsController < ApplicationController
  before_action :basic_auth, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.build(band_params)

    if @band.save
      redirect_to @band, notice: 'バンドが登録されました。'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @band.update(band_params)
      redirect_to @band
    else
      render :edit
    end
  end

  def destroy
    @band.gig_bands.destroy_all
    @band.destroy
    redirect_to bands_path
  end

  private
  def set_band
    @band = Band.friendly.find(params[:slug])
  rescue ActiveRecord::RecordNotFound
    Rails.logger.warn "Band not found with slug: #{params[:slug]}. Redirecting to index."
    redirect_to bands_path, alert: "指定されたバンドが見つかりませんでした。"
  end

  private
  def band_params
    params.require(:band).permit(
      :band_name, :member_1, :member_2, :member_3, :member_4, :member_5, :member_6, :member_7, :member_8, :member_9,
      :description, :link_name_1, :link_url_1, :link_name_2, :link_url_2, :link_name_3, :link_url_3, :link_name_4, :link_url_4, :image)
  end

  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end
  
  
end
