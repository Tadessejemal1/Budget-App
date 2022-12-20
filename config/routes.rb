Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: %i[index new create destroy]
  resources :expenses, only: %i[index show new create destroy]

  # Defines the root path route ("/")
  root "splash#index"
end
