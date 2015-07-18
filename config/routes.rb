Rails.application.routes.draw do
  resources :stores

  resources :articles

  root "articles#index"
end
