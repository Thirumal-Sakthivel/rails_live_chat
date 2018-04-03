Rails.application.routes.draw do
  resources :conversations
  resources :messages
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboard#index"
  mount ActionCable.server => '/cable'
  
end
