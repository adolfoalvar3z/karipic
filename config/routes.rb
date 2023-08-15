Rails.application.routes.draw do
  devise_for :users
  resources :comentarios
  resources :posts do
    resources :comentarios, only: [:create]
  end
  # Defines the root path route ("/")
  root to: "posts#index"
end
