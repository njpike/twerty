Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'twerts#index'

  #resources :users  # switched this out for explicit routes for practice
  post 'signup', to: 'users#create'
  get 'signup', to: 'users#signup'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
end
