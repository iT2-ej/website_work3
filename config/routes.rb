Rails.application.routes.draw do
  get 'users/top'
  get 'books/top'
devise_for :users
root to: "homes#top"
end
