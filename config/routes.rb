Rails.application.routes.draw do
  root "recipes#index"

  resources :menus
  resources :recipes
  resources :ingredients
  resources :needs
  resources :owns
  resources :items
end
