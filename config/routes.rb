Rails.application.routes.draw do

  resources :messages, only: [:create, :destroy]

  post 'login' => 'application#login'
  post 'logout' => 'application#logout'

  root to: 'messages#index'

end
