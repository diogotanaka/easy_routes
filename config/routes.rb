Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  resources :trips do
    resources :messages, only: [:index, :create]
  end

  root "trips#home"
end
