Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'login', to: 'auth#login'
      get 'permission', to: 'permission#new'
      post 'permission', to: 'permission#create'
      post 'users/create', to: 'users#create'
      get 'verify', to: 'auth#verify'
      get 'tracks/recommend/:seed_tracks', to: 'tracks#recommend'
      get 'tracks/:search_query', to: 'tracks#search'
    end
  end
end
