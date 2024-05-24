class BandsController < ApplicationController
  before_action :find_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.members = params[:band][:members].split(',').map(&:strip)
    if @band.save
      redirect_to @band
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

#   def destroy
#     @band.destroy
#     redirect_to bands_path, notice: 'Band was successfully deleted.'
#   end

  private
  def find_band
    @band = Band.find(params[:id])
  end

  private
  def band_params
    params.require(:band).permit(
      :band_name, :member_1, :member_2, :member_3, :member_4, :member_5, :member_6, :member_7, :member_8, :member_9,
      :description, :link_name_1, :link_url_1, :link_name_2, :link_url_2, :link_name_3, :link_url_3, :link_name_4, :link_url_4, :image)
  end
  
end
