Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'twerts#index'

  ## User routes
  #resources :users  # switched this out for explicit routes for practice
  post 'signup', to: 'users#create'
  get 'signup', to: 'users#signup'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  ## Twerts routes
  get 'twerts/:id', to: 'twerts#show', as: :twert
  post 'twerts', to: 'twerts#create'
end
