class SearchController < ApplicationController
  def index
    @articles = []
    if !params[:q].nil?
      @q = params[:q]
      @articles = Article.search(query: {match: {title: @q}}).records.to_a
    end
    respond_to do |format|
      format.html
      format.json { render :json => @articles.map { |article| {:id => article.id, :title => article.title, :slug => article.slug} } }
    end
  end
end
