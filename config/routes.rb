Rails.application.routes.draw do

  resources :preferences
  resources :artists do
    resources :songs, only: [:index, :show]
  end
  resources :songs

  namespace :admin do
    resources :preferences, only: [:index, :new, :create]
  end
end
