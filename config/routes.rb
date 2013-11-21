Banbanlive::Application.routes.draw do
  devise_for :users

  resources :bands

  root :to => 'welcome#index'
end
