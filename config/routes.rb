Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "books#index"
  namespace :books do
    resources :searches, only: :index
  end
  resources :books, only: [:index, :new, :create, :edit, :update] do
    resources :notes do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :users, only: [:show] do
    resources :best_books, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :book_users, only: [:create, :destroy]
end
