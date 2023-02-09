# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                         new_user_session GET    /users/sign_in(.:format)                                                                          users/sessions#new
#                             user_session POST   /users/sign_in(.:format)                                                                          users/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                                                         users/sessions#destroy
#                        new_user_password GET    /users/password/new(.:format)                                                                     devise/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                                                    devise/passwords#edit
#                            user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
#                                          PUT    /users/password(.:format)                                                                         devise/passwords#update
#                                          POST   /users/password(.:format)                                                                         devise/passwords#create
#                 cancel_user_registration GET    /users/cancel(.:format)                                                                           users/registrations#cancel
#                    new_user_registration GET    /users/sign_up(.:format)                                                                          users/registrations#new
#                   edit_user_registration GET    /users/edit(.:format)                                                                             users/registrations#edit
#                        user_registration PATCH  /users(.:format)                                                                                  users/registrations#update
#                                          PUT    /users(.:format)                                                                                  users/registrations#update
#                                          DELETE /users(.:format)                                                                                  users/registrations#destroy
#                                          POST   /users(.:format)                                                                                  users/registrations#create
#                           mypage_account GET    /mypage/account(.:format)                                                                         mypage/accounts#show
#                                   signup GET    /signup(.:format)                                                                                 users/registrations#new
#                                    login GET    /login(.:format)                                                                                  users/sessions#new
#                                   logout GET    /logout(.:format)                                                                                 users/sessions#destroy
#                                     root GET    /                                                                                                 static_pages#top
#                                    about GET    /about(.:format)                                                                                  static_pages#about
#                                  privacy GET    /privacy(.:format)                                                                                static_pages#privacy
#                                     term GET    /term(.:format)                                                                                   static_pages#term
#                show_hint_to_let_go_items GET    /to_let_go_items/show_hint(.:format)                                                              to_let_go_items#show_hint
#                          to_let_go_items GET    /to_let_go_items(.:format)                                                                        to_let_go_items#index
#                                          POST   /to_let_go_items(.:format)                                                                        to_let_go_items#create
#                       new_to_let_go_item GET    /to_let_go_items/new(.:format)                                                                    to_let_go_items#new
#                      edit_to_let_go_item GET    /to_let_go_items/:id/edit(.:format)                                                               to_let_go_items#edit
#                           to_let_go_item GET    /to_let_go_items/:id(.:format)                                                                    to_let_go_items#show
#                                          PATCH  /to_let_go_items/:id(.:format)                                                                    to_let_go_items#update
#                                          PUT    /to_let_go_items/:id(.:format)                                                                    to_let_go_items#update
#                                          DELETE /to_let_go_items/:id(.:format)                                                                    to_let_go_items#destroy
#                    done_letting_go_items GET    /done_letting_go_items(.:format)                                                                  done_letting_go_items#index
#                                          POST   /done_letting_go_items(.:format)                                                                  done_letting_go_items#create
#                 new_done_letting_go_item GET    /done_letting_go_items/new(.:format)                                                              done_letting_go_items#new
#                edit_done_letting_go_item GET    /done_letting_go_items/:id/edit(.:format)                                                         done_letting_go_items#edit
#                     done_letting_go_item GET    /done_letting_go_items/:id(.:format)                                                              done_letting_go_items#show
#                                          PATCH  /done_letting_go_items/:id(.:format)                                                              done_letting_go_items#update
#                                          PUT    /done_letting_go_items/:id(.:format)                                                              done_letting_go_items#update
#                                          DELETE /done_letting_go_items/:id(.:format)                                                              done_letting_go_items#destroy
#                           quote_favorite DELETE /quotes/:quote_id/favorite(.:format)                                                              quotes/favorites#destroy
#                                          POST   /quotes/:quote_id/favorite(.:format)                                                              quotes/favorites#create
#                                   quotes GET    /quotes(.:format)                                                                                 quotes#index
#                                    quote GET    /quotes/:id(.:format)                                                                             quotes#show
#                              achievement GET    /achievement(.:format)                                                                            achievements#show
#                              sidekiq_web        /sidekiq                                                                                          Sidekiq::Web

Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  namespace :mypage do
    resource :account, only: :show
  end

  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end

  root to: 'static_pages#top'
  get '/about', to: 'static_pages#about'
  get '/privacy', to: 'static_pages#privacy'
  get '/term', to: 'static_pages#term'

  resources :to_let_go_items do
    collection do
      get :show_hint
    end
  end

  resources :done_letting_go_items

  resources :quotes, only: %i[index show] do
    resource :favorite, only: %i[create destroy], module: :quotes
  end

  resource :achievement, only: :show

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
