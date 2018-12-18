Rails.application.routes.draw do

  resources :lists do
    resources :items, except: [:index]
  end
  
  namespace :api, defaults: { format: :json } do
    resources :users
  end

  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
