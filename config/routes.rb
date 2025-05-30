Rails.application.routes.draw do
  get 'containers/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
resources :containers, only: [:index, :show, :new, :create] do
  resources :bookings, only: [:create]
end
resources :bookings, only: [:index] do
  member do
    patch "accept"
    patch "decline"
  end
  collection do
    get :completed
    get :rejected
    get :purchases
    get :pending
    get :active
  end
end

end
