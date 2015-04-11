Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :vehicles
    collection do
      get :me
    end
  end

  authenticated :user do
    devise_scope :user do
      root to: 'users#me'
    end
  end

  unauthenticated do
    devise_scope :user do
      root 'welcome#index', as: :unauthenticated
    end
  end
end
