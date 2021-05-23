module Blog
  class ArticlesController < BaseController
    def index
      @previous_older_than = Time.zone.parse(params[:older_than]) rescue nil
      @articles = Article.published
                         .recent
                         .limit(10)
      if @previous_older_than
        @articles = @articles.where('articles.created_at < ?', @previous_older_than)
      end
      
      @next_older_than = @articles.last.try(:created_at)
    end

    def show
      @article = Article.friendly.find(params[:slug])
    end
  end
end
