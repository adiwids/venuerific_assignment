Rails.application.routes.draw do
  devise_for :users, skip: %i[confirmation unlock passwords]
  root to: 'blog/home#index'
  resources :articles, only: %i[index show],
                       controller: 'blog/articles',
                       param: 'slug'
  devise_scope :user do
    namespace :admin do
      root to: 'dashboard#index'
      resources :articles, param: 'slug'
      resources :users
    end
  end
end
