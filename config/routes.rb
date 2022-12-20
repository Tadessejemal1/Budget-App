Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :categories, only: %i[index new create destroy]
  resources :expenses, only: %i[index show new create destroy]
  root "splash#index"
end
