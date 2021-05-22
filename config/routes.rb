Rails.application.routes.draw do
  devise_for :users, skip: %i[confirmation unlock]
  root to: 'blog/home#index'
  devise_scope :user do
    scope module: 'admin' do
      get '/admin', to: 'dashboard#index', as: 'admin_root'
    end
  end
end
