Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#index'
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  # Declare a route for posts
  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end
  
  namespace :private do 
    resources :conversations, only: [:create] do
      member do
        post :close
        post :open
      end
    end
    resources :messages, only: [:index, :create]
  end
  
  resources :contacts, only: [:create, :update, :destroy]
  
  namespace :group do 
    resources :conversations do
      member do
        post :close
        post :open
      end
    end
    resources :messages, only: [:index, :create]
  end
end
