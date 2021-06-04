Rails.application.routes.draw do
  devise_for :users
  root to: "spaces#index"
  resources :spaces, only: %i[new create show edit update destroy]
end
