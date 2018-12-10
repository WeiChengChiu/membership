Rails.application.routes.draw do
  root to: "homes#index"
  devise_for :users

  namespace :admin do
    resources :products, except: [:show, :destroy]
    resources :users, only: [] do
      member do
        post :update_role
      end
    end
  end
end
