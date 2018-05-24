Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :buildings do
    resources :photos, only: [:new,:create, :edit, :update]
  end
  resources :photos, only: [:index, :show, :destroy]
  resources :companies, only: [:new, :create, :update, :edit, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
