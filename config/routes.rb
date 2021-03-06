Rails.application.routes.draw do
  root 'staticpages#home'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  namespace:admin do
    get '/home', to: 'users#home'
    resources :users
    resources :categories do
      resources :words
    end
  end

  resources :lessons do
    resources :answers
  end

  resources :words, only: [:index]
  resources :categories
  resources :users
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
