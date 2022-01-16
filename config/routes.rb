Rails.application.routes.draw do

  root 'hello#index'
  get 'hello/javatest' => 'hello#javatest'
  get 'hello/htmltest' => 'hello#htmltest'
  
  resources :maps
  resources :tags, :only => [:destroy]

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  devise_for :users
  resources :users, only: [:index, :show] 
  resources :relationships, only: [:create, :destroy]

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

  resources :comments, only: [:show] do
    resources :replies, only: [:create, :destroy]
  end

end