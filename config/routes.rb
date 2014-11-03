Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  post '/pokemon/create', to: 'pokemon#create', as: 'pokemons'
  get '/pokemon/new', to: 'pokemon#new', as: 'new'
  patch '/capture/:id', to: 'pokemon#capture', as: 'capture'
  patch '/damage/:id', to: 'pokemon#damage', as: 'damage'
end
