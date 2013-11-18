Bone::Application.routes.draw do
  resources :things


  root to: 'application#index'
end
