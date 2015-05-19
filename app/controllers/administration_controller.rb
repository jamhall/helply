class AdministrationController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.unpublished.paginate(:page => params[:page], :per_page => 25)
  end

  def article_new
    @article = Article.new
  end

  def article_delete
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = 'The article was successfully deleted'
    redirect_to :administration
  end

  def article_create
    @article = Article.new article_params
    if @article.save
      redirect_to :administration
    else
      render 'article_new'
    end
  end

  def articles_published
    @articles = Article.published.paginate(:page => params[:page], :per_page => 25)
  end

  def article_edit
    @article = Article.find(params[:id])
  end

  def article_update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "Successfully updated"
      redirect_to administration_article_edit_path(@article)
    else
      render 'article_edit'
    end
  end

  def article_publish
    @article = Article.find(params[:id])
    @article.published_at = Time.now
    @article.save
    flash[:success] = 'The article was successfully published'
    redirect_to :administration_articles_published
  end

  def article_unpublish
    @article = Article.find(params[:id])
    @article.published_at = nil
    @article.save
    flash[:success] = 'The article was successfully unpublished'
    redirect_to :administration
  end

  private
  def article_params
    params.require(:article).permit :title, :topic_id, :content, :summary
  end
end
