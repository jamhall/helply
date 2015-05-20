class Admin::ArticlesController < Admin::AdminController

  def new
    @article = Article.new
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = 'The article was successfully deleted'
    redirect_to :admin
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to :admin
    else
      render 'article_new'
    end
  end

  def published
    @articles = Article.published.paginate(:page => params[:page], :per_page => 25)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "Successfully updated"
      redirect_to admin_article_edit_path(@article)
    else
      render 'article_edit'
    end
  end

  def publish
    @article = Article.find(params[:id])
    @article.published_at = Time.now
    @article.save
    flash[:success] = 'The article was successfully published'
    redirect_to :admin_articles_published
  end

  def unpublish
    @article = Article.find(params[:id])
    @article.published_at = nil
    @article.save
    flash[:success] = 'The article was successfully unpublished'
    redirect_to :admin
  end

  private
  def article_params
    params.require(:article).permit :title, :topic_id, :content, :summary
  end

end
