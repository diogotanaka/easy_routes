Rails.application.routes.draw do
  devise_for :users
  
  resources :trips do
    resources :messages, only: [:create]
  end

  root "trips#index"
end
