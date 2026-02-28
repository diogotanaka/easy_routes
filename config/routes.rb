Rails.application.routes.draw do
  devise_for :users

  resources :trips do
    resources :messages, only: [:index, :create]
  end

  root "trips#home"
end
