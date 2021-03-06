Rails.application.routes.draw do
  get 'records/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items, only:[:new, :create, :show, :edit, :update, :destroy] do 
    resources :records, only:[:index, :create]
  end
end
