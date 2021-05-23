module Blog
  class ArticlesController < BaseController
    def index
      older_than = Time.zone.parse(params[:older_than]) rescue Time.zone.now
      @articles = Article.published
                         .recent
                         .where('articles.created_at < ?', older_than)
                         .limit(10)
    end

    def show
      @article = Article.friendly.find(params[:slug])
    end
  end
end
