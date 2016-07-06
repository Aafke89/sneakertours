Rails.application.routes.draw do
  root to: 'pages#home'

  resources :locations, only: [:show, :index]
end
