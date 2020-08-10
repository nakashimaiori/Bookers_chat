Rails.application.routes.draw do
  get 'chats/create'
  get 'chats/show'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :edit, :destroy]
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :users, only: [:show, :edit, :update, :index]

  resources :chats, only: [:create, :show]
  resources :rooms, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
