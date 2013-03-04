Ventitloud::Application.routes.draw do

  resources :vents, only: [:index,:show] do
    resources :shares
  end

  authenticated :user do
    root :to => 'home#index'
  end
  
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :vents
  end
end