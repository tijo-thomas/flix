Rails.application.routes.draw do

  resources :genres
  get "signin" => "sessions#new"
  resource :session  
  get "signup" => "users#new"
  resources :users
  root "movies#index"
  get "movies/filter/:scope" => "movies#index", as: "filtered_movies"
  resources :movies do
    resources :reviews
    resources :favorites
  end

  # get "movies" => "movies#index"
  # get "movies/new" => "movies#new"
  # get "movies/:id" => "movies#show", as: "movie"
  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"

end