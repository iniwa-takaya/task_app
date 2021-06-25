Rails.application.routes.draw do
  devise_for :users
  root to: "spaces#index"
  resources :spaces, only: %i[index new create edit update destroy]  do
    resources :tasks, only: %i[index create edit update]
  end
end
