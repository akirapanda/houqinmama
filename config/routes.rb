Houqinmama::Application.routes.draw do  
  mount WeixinRailsMiddleware::Engine, at: "/"
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
          get 'to_next'
        end
      end
      resources :shopping_items

      resources :goods
      resources :goods_cates
      
      resources :articles
      resources :article_cates
      
      resources :products do
        collection do
          get 'new_list'
        end
         member do
            get 'photo'
            get 'on_sale'
            get 'off_sale'
          end
      end

      resources :users
  end
  
  namespace :mobile do
    root :to => 'home#index'
    resources :carts
    resources :articles
    
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
    resources :shoppings do
      collection do
        get 'history'
      end
    end
  end
end
