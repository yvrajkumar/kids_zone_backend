Rails.application.routes.draw do
  #resources :products
  #devise_for :admin_users, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do 
      resources :signup
      resources :signin
      resources :products
      resources :orderitems
      resources :additem
      resources :cartitems
      resources :placeorder
      resources :removefromcart
      resources :returnorder
      resources :deleteprofile
      resources :updateprofile
      resources :sortasc
      resources :sortdesc
    end 
  end 
end
