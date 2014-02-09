Weightable::Application.routes.draw do
  root 'users#index'

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :weights do
    resources :comments
  end
  
  resources :friendships

  get 'users' => 'users#index', as: 'users'
  get 'users/:id' => 'users#show', as: 'user'
  # get 'weights/personal/:user_id' => 'users#personal', as: 'personal'
end
