module Blog
  class HomeController < BaseController
    def index
      @articles = Article.published.recent.limit(5)
      @next_older_than = @articles.last.try(:created_at).presence || Time.zone.now
    end
  end
end
