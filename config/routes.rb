Ventitloud::Application.routes.draw do

  resources :moods


  resources :vents do
    resources :shares
  end
  
  resources :moods do
    resources :vents
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