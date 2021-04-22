Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/about', to: 'about#index'

  get 'contact/index'
  resources :contact, only: [:index, :new, :create]
  post '/contact/index', to: 'contact#create'

  post '/npcs/save/:id', to: 'npc_models#new'
  get '/npcs/:id', to: 'npc_models#show'
  delete '/npcs/destroy/:id', to: 'npc_models#destroy'

  resources :users, only: [:create, :destroy]
  delete '/users/destroy/:id', to: 'users#destroy'

  namespace :user do
    get '/dashboard', to: 'dashboard#show'
  end

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :npcs, only: [:index]
    resources :users, only: [:index, :show]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy'

  resources :npc_pdfs, only: [:show]
  post '/npc_pdfs/:id', to: 'npc_pdfs#show'
end
