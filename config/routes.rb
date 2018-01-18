Rails.application.routes.draw do
root 'users#index'
post '/signup' => 'users#create'
get 'users/:id' => 'users#show'
post '/login' => 'sessions#create'
get 'ideas' => 'ideas#index'
post '/posts' => 'ideas#create'
get '/ideas/:id' => 'ideas#show'
get '/logout' => 'sessions#destroy'

resources :ideas do
  resources :likes
end
end
