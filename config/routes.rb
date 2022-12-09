Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'samples#index'

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
