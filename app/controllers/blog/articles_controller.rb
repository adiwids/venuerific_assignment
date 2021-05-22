module Blog
  class ArticlesController < ApplicationController
    skip_before_action :authenticate_user!

    def index
      @articles = Article.published
    end

    def show
      @article = Article.friendly.find(params[:slug])
    end
  end
end
