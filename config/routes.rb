Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'courses#index'
  
  resources :courses, except: [:index, :destroy]

  get 'about', to: 'pages#about'

  resources :students, except: [:destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
