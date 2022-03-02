Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web =>"/sidekiq"
  devise_for :users
  root "articles#index"
  resources :articles do
  resources :comments
  get '/search',to: "articles#search"
  end
end
