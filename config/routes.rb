Houqinmama::Application.routes.draw do  
  devise_for :users
    
  root 'home#test'
  
  resources :products , :only => ['show','index'] do

  end
  
  resources :carts 
  
  namespace :admin do
    root :to => 'home#index'  
  end
  
  
  namespace :weixin do
    resources :weixin
  end
end
