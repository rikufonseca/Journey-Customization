Rails.application.routes.draw do
   root to: 'pages#home'
  devise_for :users
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
