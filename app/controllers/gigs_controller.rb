class GigsController < ApplicationController
  before_action :basic_auth, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_gig, only: [:show, :edit, :update, :destroy]

  def index
    @gigs = Gig.all
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)

    if @gig.save
      redirect_to @gig
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @gig.update(gig_params)
      redirect_to @gig
    else
      render :edit
    end
  end

  def destroy
    @gig.destroy
    redirect_to gigs_path
  end

  private
  def find_gig
    @gig = Gig.find(params[:id])
  end

  private
  def gig_params
    params.require(:gig).permit(:gig_name, :description, :link_name, :link_url, :image)
  end

  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end
  
  
end
