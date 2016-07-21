Rails.application.routes.draw do
  root to: 'pages#home'

  resources :locations, only: [:show, :index, :new, :create, :edit, :update]

  resources :events, only: [:show, :index, :new, :create, :edit, :update]
end
