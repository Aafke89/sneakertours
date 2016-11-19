Rails.application.routes.draw do
  devise_for :users,
        controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions',
        passwords: 'users/passwords'
        }

  root to: 'pages#home'
  get "/pages/:page" => "pages#show"

  post 'pages/contact', to: 'pages#form'

  resources :locations, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    member do
        patch :accept
        patch :decline
      end
  end

  resources :events, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    member do
        patch :accept
        patch :decline
      end
  end


  resources :admins, only: [:index]
end
