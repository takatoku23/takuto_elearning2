Rails.application.routes.draw do
  root 'staticpages#home'
  get '/login', to:'sessions#new'
  get '/profile', to:'users#profile'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  namespace:admin do
    get '/home', to: 'users#home'
    get '/top', to: 'users#top'
  end
  resources :users
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
