Rails.application.routes.draw do
 root to: 'toppages#index'
 
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :show, :new, :create] do
   member do
     get :followings
     get :followers
     get :likers
   end
 end
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
resources :microposts, only: [:create, :destroy] do
  member do
    get :like_micropost
  end
end
resources :relationships, only: [:create, :destroy]
resources :favorites, only: [:create, :destroy]
end
