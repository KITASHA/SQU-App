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
      redirect_to @band, notice: 'Band was successfully created.'
    else
      render :new
    end
  end

  def show
  end

#   def edit
#   end

#   def update
#     if @band.update(band_params)
#       redirect_to bands_path, notice: 'Band was successfully updated.'
#     else
#       render :edit
#     end
#   end

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
    params.require(:band).permit(:band_name, :description, :link_name, :link_url, :image).merge(user_id: current_user.id)
  end
  
end
