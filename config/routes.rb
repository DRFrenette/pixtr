Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  root "galleries#index"

  resources :users, only: [:new, :create, :show, :index]
  resources :groups, only: [:index, :new, :create, :show] do
    resources :group_memberships, only: [:create, :destroy]
  end

  resources :galleries do
    resources :images, except: [:index]
  end

  resources :images, only: [] do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy]
  end

  resource :search, only: [:show]
end
