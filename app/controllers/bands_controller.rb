class BandsController < ApplicationController
  def index
    @parts = Part.all
    @songs = Song.all
    render json: @parts,@songs
  end
end
