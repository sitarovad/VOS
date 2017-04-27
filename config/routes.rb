Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/help', to: 'static_pages#help', as: 'helf'
  get '/about', to: 'static_pages#about'

  root 'static_pages#home'

  resources :users
  resources :actors, only: [:new, :index, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
