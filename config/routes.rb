Rails.application.routes.draw do
  root 'staticpages#home'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  namespace:admin do
    get '/home', to: 'users#home'
    resources :users
    resources :categories
  end
  resources :users
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
