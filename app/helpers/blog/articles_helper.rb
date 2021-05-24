module Blog::ArticlesHelper
  def articles_list
    render partial: 'blog/articles/list',
           locals: { articles: @articles,
                     newer_than: @previous_older_than,
                     older_than: @next_older_than }
  end
end
