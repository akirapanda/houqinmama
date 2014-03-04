Houqinmama::Application.routes.draw do
  devise_for :users
  namespace :weixin do
    resources :weixin
  end
end
