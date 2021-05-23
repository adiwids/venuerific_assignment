module Blog
  class ArticlesController < BaseController
    def index
      @articles = Article.published
    end

    def show
      @article = Article.friendly.find(params[:slug])
    end
  end
end
