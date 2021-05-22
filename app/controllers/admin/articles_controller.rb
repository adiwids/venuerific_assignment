module Admin
  class ArticlesController < BaseController
    load_and_authorize_resource

    before_action :find_article, except: %i[index new create]

    def index
      @articles = load_articles
    end

    def new
      @article = current_user.articles.new
    end

    def create
      @article = current_user.articles.new(article_params)

      if @article.save
        flash[:notice] = 'Article posted'
        redirect_to admin_articles_path
      else
        flash[:error] = @article.errors.full_messages.first
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @article.update(article_params)
        flash[:notice] = 'Article updated'
        redirect_to admin_article_path(slug: @article.slug)
      else
        flash[:error] = @article.errors.full_messages.first
        render :edit
      end
    end

    def destroy
      if @article.destroy
        flash[:notice] = 'Article deleted'
      else
        flash[:error] = @article.errors.full_messages.first
      end

      redirect_to admin_articles_path
    end

    private

    def load_articles
      collection = if current_user.administrator?
                     Article.includes(:author)
                   else
                     current_user.articles
                   end

      collection
    end

    def article_params
      params.require(:article).permit(Article.permitted_attributes)
    end

    def find_article
      @article = load_articles.where(articles: { slug: params[:slug] }).first
    end
  end
end
