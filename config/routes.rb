Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  resources :clubs
  resources :messages
  resources :sessions

  root to: 'welcome#index'
end
