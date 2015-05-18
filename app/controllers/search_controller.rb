class SearchController < ApplicationController
  def index
    if params[:q].nil?
      @articles = []
    else
      @q = params[:q]
      @articles = Article.search(@q)

    end
  end
end
