Rails.application.routes.draw do
  get 'users/my_portfolio'
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  resources :user_stocks, only: [:create, :destroy]
  get 'my_friends', to: "users#my_friends"
  resources :users, only: [:show]
  resources :friendships
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"
end
