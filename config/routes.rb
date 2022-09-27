Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users

  get 'home/about' => 'homes#about', as:'about'

root to: "homes#top"
end
