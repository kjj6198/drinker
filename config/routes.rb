Rails.application.routes.draw do
  resources :drink_shops
  resources :menus
  devise_for :users, :controllers => { :omniauth_callbacks => "users/oauth_callbacks" }

  root "pages#index"
end
