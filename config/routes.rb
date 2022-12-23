Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: %i[index new create destroy] do 
    resources :expenses, only: %i[index]
  end
  resources :expenses, only: %i[index show new create destroy]

  # Defines the root path route ("/")
  root "splash#index"
end
