Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "books#index"
  namespace :books do
    resources :searches, only: :index
    resources :paapi_searches, only: :index
  end
  resources :books, only: [:index, :new, :create] do
    resources :notes do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :users, only: :show do
    resources :best_books, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :book_users, only: [:create, :update, :destroy]
  resources :action_plans do
    member do
      patch "count_down"
      patch "count_up"
    end
  end
end
