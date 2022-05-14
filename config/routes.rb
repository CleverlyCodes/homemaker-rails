Rails.application.routes.draw do
  root "recipes#index"

  get "/recipes", to: "recipes#index"
end
