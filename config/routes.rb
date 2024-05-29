Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :boards
  resources :comments, only: %i[create destroy]
  # Defines the root path route ("/")
  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show'
end
