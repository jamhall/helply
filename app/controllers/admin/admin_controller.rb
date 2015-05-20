class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @articles = Article.unpublished.paginate(:page => params[:page], :per_page => 25)
    render "admin/index"
  end

end