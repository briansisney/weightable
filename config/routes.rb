Weightable::Application.routes.draw do
  
  devise_for :users
  resources :comments

  resources :weights 
  
  root 'users#index'

  get 'users/:id' => 'users#show', as: 'user'
end
