module Blog
  class HomeController < BaseController
    def index
      @articles = Article.published.recent.limit(5)
    end
  end
end
