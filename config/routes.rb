Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :cards, only: [:index, :new, :create] 
  end
end