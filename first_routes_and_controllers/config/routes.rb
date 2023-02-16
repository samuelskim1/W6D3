Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :artworks, only: [:create, :destroy, :index, :show, :update]
  resources :artwork_shares, only: [:create, :destroy]
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
  end

  # get 'users/', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # patch 'users/:id', to: 'users#update'
  # post 'users/', to: 'users#create'
  # delete 'users/:id', to: 'users#destroy'
  # get 'users/new', to: 'users#new'
  # get 'users/:id/edit', to: 'users#edit'
  # put 'users/:id', to: 'users#update'
  # Defines the root path route ("/")
  # root "articles#index"
end