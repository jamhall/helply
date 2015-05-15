class ArticlesController < ApplicationController
  def create
  end

  def show
    @article = Article.find(params[:id])
  end
end
