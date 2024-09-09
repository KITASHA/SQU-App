class GigsController < ApplicationController
  before_action :basic_auth, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  def index
    @gigs = Gig.includes(:bands).order(date: :asc)
  end

  def new
    @gig = Gig.new
    @bands = Band.all
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.user_id = current_user.id
    @bands = Band.all 
  
    if @gig.save
      redirect_to @gig, notice: 'Gig was successfully created.'
    else
      flash.now[:alert] = 'Failed to create gig. Please check the errors below.'
      render :new, status: :unprocessable_entity, locals: { gig: @gig }
    end
  end

  def show
  end

  def edit
    @bands = Band.all
  end

  def update
    @bands = Band.all
    if @gig.update(gig_params)
      redirect_to @gig, notice: 'Gig was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update gig. Please check the errors below.'
      render :edit, status: :unprocessable_entity, locals: { gig: @gig }
    end
  end

  def destroy
    @gig.destroy
    redirect_to gigs_path
  end

  private
  def set_gig
    @gig = Gig.find(params[:id])
  end

  def gig_params
    params.require(:gig).permit(:gig_name, :date, :start_time, :end_time, :description, :link_name, :link_url, :image, band_ids: [])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end
  
  
end