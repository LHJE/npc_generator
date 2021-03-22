Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/registration', to: 'users#new', as: :registration
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  post '/npcs/save/:id', to: 'npc_models#new'
  get '/npcs/:id', to: 'npc_models#show'

  resources :users, only: [:create]

  namespace :user do
    get '/dashboard', to: 'dashboard#show'
  end
end
