Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope module: :api, defaults: {format: 'json'} do
    namespace :v1 do
      post :sessions, controller: :sessions, action: :get_token
      resources :menus, only: [:show, :index]
      resources :orders
    end
  end

    root to: 'admin/dashboard#index'
    
    get '/menu_items/images/:id/:style' => 'menu_items#image'

  end
