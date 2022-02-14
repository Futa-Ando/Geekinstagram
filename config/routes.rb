Rails.application.routes.draw do

  root 'hello#index'
  get 'hello/detail' => 'hello#detail'
  
  resources :maps
  resources :tags, :only => [:destroy]

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  devise_for :users, controllers: {   registrations: 'users/registrations',
                      sessions: 'users/sessions' }
  resources :users, only: [:index, :show] 
  get 'user/:id/picture' => 'users#picture', as: 'user_picture'
  get 'user/:id/like_picture' => 'users#like_picture', as: 'user_like_picture'
  get 'user/:id/favorite_picture' => 'users#favorite_picture', as: 'user_favorite_picture'
  get 'user/:id/following' => 'users#following', as: 'user_following'
  get 'user/:id/follower' => 'users#follower', as: 'user_follower'
  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:new, :create, :show]
  resources :notifications, only: [:index, :update]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'picture/liked' => 'pictures#liked'
  get 'picture/viewed' => 'pictures#viewed'
  get 'picture/commented' => 'pictures#commented'

  resources :pictures do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :words, only: [:index, :new, :create, :destroy]
  get '/word/hashtag/:name', to: "words#hashtag"

  resources :comments, only: [:show] do
    resources :replies, only: [:create, :destroy]
  end

end