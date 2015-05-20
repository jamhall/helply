class ArticlesController < ApplicationController
  def show
    if user_signed_in?
      @article = Article.find(params[:id])
    else
      @article = Article.published.find(params[:id])
    end
    slug = params[:slug]
    redirect_to(articles_show_url(:id => @article.id, :slug => @article.slug)) unless slug == @article.slug
  end
end
