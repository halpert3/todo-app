Rails.application.routes.draw do
  resources :user_tasks

  root 'user_tasks#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
