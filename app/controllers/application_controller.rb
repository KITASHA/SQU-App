class ApplicationController < ActionController::Base
  before_action :load_topics

  private
  def load_topics
    @topics = Topic.all
  end

end
