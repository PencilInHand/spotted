Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :vehicles

  resources :users
end
