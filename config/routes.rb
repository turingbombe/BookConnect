Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, except: [:new]
  resources :clubs
  resources :messages
  resources :sessions, except: [:new, :destroy]

  root to: 'welcome#index'

  get '/signout',to: 'sessions#destroy', as: 'signout'
  get '/signin', to: 'sessions#new', as: 'signin'
  get '/users/:id/delete_user', to: 'users#destroy',as: 'delete_user'
end
