Rails.application.routes.draw do
  
  root 'pages#index'

  resources :products
  resources :retailers
end
