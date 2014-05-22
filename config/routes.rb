Houqinmama::Application.routes.draw do  
  devise_for :users
    
  root 'home#test'
  
  resources :products , :only => ['show','index'] do

  end
  
  resources :carts 
  resources :users do
    member do
      get 'shopping'
      get  'history_buy'
    end
  end
  namespace :admin do
    root :to => 'home#index'  
      resources :shoppings do
        collection do
          match 'search' => 'shoppings#search', via: [:get, :post], as: :search
          get 'uncompleted'
        end

        member do
          get 'to_process'
          get 'to_complete'
        end
      end

      resources :orders
      resources :goods
      resources :goods_cates
      
      
      
      resources :products do
        member do
          get 'photo'
        end
      end
      resources :keywords

      resources :reports do
         collection do
           get 'products'
           get 'customers'
           get 'sale'
           get 'customer_sale'
         end 
      end
  end
  
  namespace :mobile do
    root :to => 'home#index'
    resources :carts
    
    resources :cart_items do
      member do
        get 'plus'
        get 'minus'
      end
    end
    
    resources :home do 
      collection do
        get 'category'
      end
    end
    resources :products do
      collection do
        get 'product_cate'
      end
    end  
    resources :shoppings
  end
end
