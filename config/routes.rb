Rails.application.routes.draw do
  resources :challenges, only:[:index, :show]
  resources :attempts, only:[:create]

  root to: "challenges#index"
end
