Rails.application.routes.draw do
  devise_for :users
  resources :passwords do
    resources :shares, only: [:new, :destroy, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "passwords#index"
end
