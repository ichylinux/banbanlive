Banbanlive::Application.routes.draw do
  devise_for :users

  resources :admin, :only => 'index'
  resources :bands

  root :to => 'welcome#index'
end
