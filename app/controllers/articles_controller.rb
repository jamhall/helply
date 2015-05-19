class ArticlesController < ApplicationController
  def show
    if user_signed_in?
      @article = Article.find(params[:id])
    else
      @article = Article.published.find(params[:id])
    end
  end
end
