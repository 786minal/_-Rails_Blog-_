Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web =>"/sidekiq"
  devise_for :users
  root "articles#index"
  resources :articles do
  resources :comments
  
    # collection do 
    #   get 'search'
  get 'search',to: "articles#search"
  #get '/search' => 'articles#search', :as => 'search_page'
  end
end
