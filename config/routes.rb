Rails.application.routes.draw do
  resources :stores

  resources :articles

  root "articles#index"

  get "services/stores", :to => "stores#services_filter", :defaults => { :format => "json" }
  get "services/articles/stores/:id", :to => "stores#services_filter", :defaults => { :format => "json" }
  get "services/articles", :to => "articles#services_filter", :defaults => { :format => "json" }
end
