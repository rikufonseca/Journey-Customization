Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :journeys do
    resources :bookings, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:destroy, :edit, :update]  do 
    member do 
      get :accept
      get :refuse
    end
  end
end
