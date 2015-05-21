class HomeController < ApplicationController
  def index
    @topics = Topic.all
    @articles = Article.published.paginate(:page => params[:page], :per_page => 25)
    @popular_articles = Article.published.where('impressions_count > 0').order('impressions_count DESC').limit(5)
    @recently_added_articles = Article.published.order('created_at DESC').limit(5)
    @recently_updated_articles = Article.published.order('updated_at DESC').limit(5)
  end
end
