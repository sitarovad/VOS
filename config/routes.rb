Rails.application.routes.draw do
  get '/genres', to: 'films#genres'
  get '/genres/index', to: 'films#genres_index'
  get '/films/search', to: 'films#search'

  get '/recommendation', to: 'films#recommend'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/about', to: 'static_pages#about'
  get '/people', to: 'static_pages#people'
  get '/person', to: 'static_pages#person'
  get '/people/search', to: 'static_pages#search'

  root 'static_pages#home'

  resources :users do
    resources :user_films, only: [:new, :index, :create, :show]
  end

  resources :actors, only: [:new, :index, :create, :show]
  resources :directors, only: [:new, :index, :create, :show]
  resources :films

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
