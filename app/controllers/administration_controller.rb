class AdministrationController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 25)
  end


  def article_create

  end

  def articles_published
    @articles = Article.paginate(:page => params[:page], :per_page => 25)
  end

end
