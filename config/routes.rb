Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  root to: 'pages#home'
  get "/pages/:page" => "pages#show"

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
