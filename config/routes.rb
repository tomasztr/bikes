Rails.application.routes.draw do
  root to: 'static_pages#home'
  devise_for :users
  
  namespace :control_panel do
    resources :bikes
    resources :orders
  end
  
end

