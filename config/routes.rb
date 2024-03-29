Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'tweets#index'

  resources :tweets, except: [:edit, :update] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

end
