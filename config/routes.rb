Rails.application.routes.draw do
  root to: 'pages#home'
  resources :journeys, only: [:index, :show ] do
    resources :bookings, only: [:new, :create, :edit, :update]

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :journey, only: [:destroy, :new, :create, :edit, :update, :accept]
resources :bookings, only: [:destroy]
end
