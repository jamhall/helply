class Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
    if params.has_key?(:topic_id) && Topic.exists?(params[:topic_id])
      @topic = Topic.find(params[:topic_id])
      @articles = Article.paginate(:page => params[:page], :per_page => 20).where('topic_id = ?', params[:topic_id])
    else
      @articles = Article.paginate(:page => params[:page], :per_page => 20)
    end
    render "admin/index"
  end

end