Rails.application.routes.draw do
  resources :challenges, only:[:index, :show]
  resources :attempts, only:[:create]

  get "/reset", to: "attempts#reset"

  root to: "challenges#index"
end
