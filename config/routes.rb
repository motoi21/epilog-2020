Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  root to: "drawings#index"
  resources :users, only: [:show, :edit, :update] do
    resources :profiles, only: [:edit, :update]
    resources :posts, only: [:index]
    resources :sales, only: [:index]
  end
  resources :offers, only: [:new]
  resources :drawings do
    resources :purchases, only: [:new, :create]
  end
end
