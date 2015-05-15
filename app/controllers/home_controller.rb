class HomeController < ApplicationController
  def index
    @topics = Topic.all
    @articles = Article.paginate(:page => params[:page], :per_page => 25)
  end
end