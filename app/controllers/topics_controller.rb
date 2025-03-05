class TopicsController < ApplicationController
  before_action :move_to_root, only: [:new, :create, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private
  def topic_params
    params.require(:topic).permit(:date, :news)
  end

  def move_to_root
    unless session[:authenticated]
      redirect_to root_path
    end
  end
end