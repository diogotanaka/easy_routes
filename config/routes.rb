Rails.application.routes.draw do
  resources :trips do
    resources :messages, only: [:create]
  end

  root "trips#index"
end
