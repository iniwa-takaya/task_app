Rails.application.routes.draw do
  devise_for :users
  root to: "spaces#index"
  resources :spaces, expect: %i[index show]  do
    resources :tasks, only: %i[index create]
  end
end
