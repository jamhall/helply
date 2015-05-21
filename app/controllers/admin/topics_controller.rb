class Admin::TopicsController < Admin::AdminController

  def index
    @topics = Topic.all
  end

 
  private
  def article_params
    params.require(:article).permit :title, :topic_id, :content, :summary
  end

end
