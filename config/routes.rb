Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users

root to: "homes#top"
end
