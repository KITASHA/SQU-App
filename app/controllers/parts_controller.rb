class PartsController < ApplicationController
  before_action :set_songs, only: [:index, :new, :create,:edit]
  before_action :set_part, only: [:edit, :update, :destroy]
  def index
    @parts = Part.all
  end

  def new
    @part = Part.new
    @song_1 = @songs.first
    @song_2 = @songs.second
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to parts_path
    else
      render :new
    end
  end

  def edit
    @song_1 = @songs.first
    @song_2 = @songs.second
  end

  def update
    if @part.update(part_params)
      redirect_to parts_path
    else
      render :edit
    end
  end

  def destroy
    @part.destroy
    redirect_to parts_path
  end


  private

  def set_songs
    @songs = Song.all
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:nickname, :song_part_id_1, :song_part_id_2).merge(user_id: current_user.id)
  end
end