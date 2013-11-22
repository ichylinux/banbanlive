Banbanlive::Application.routes.draw do
  devise_for :users

  resources :admin, :only => 'index'

  resources :bands do
    collection do
      get 'new_band_member'
      get 'search_members'
    end
    member do
      get 'logo'
    end
  end
  
  resources :members

  root :to => 'welcome#index'
end
