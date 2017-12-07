Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#create' #here :provider is facebook
  get '/signout' => 'sessions#destroy', as: :signout

  resources :user_tasks

  root 'user_tasks#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
