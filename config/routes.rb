Rails.application.routes.draw do

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, except: [:new]
  resources :clubs do
  resources :messages
end
  resources :sessions, except: [:new, :destroy]
  resources :invitations

  root to: 'welcome#index'

  get '/signup', to: "users#new", as: "signup"
  get '/signout',to: 'sessions#destroy', as: 'signout'
  get '/signin', to: 'sessions#new', as: 'signin'
  get '/users/:id/delete_user', to: 'users#destroy',as: 'delete_user'

  mount ActionCable.server => '/cable'

end
