Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: %i[create destroy]
end
