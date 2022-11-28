Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :books do
    resources :book_copies, only: %i[new create]
  end

  resources :book_copies, only: %i[index show] do
    resources :orders, only: %i[new create index] do
      # member do
      #   patch "accept_order"
      #   patch "reject_order"
      # end

      resources :order_reviews, only: %i[create new]
    end
  end

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end

  resources :orders do
    member do
      patch "accept"
      patch "reject"
    end
  end

  get "dashboard/:id", to: "pages#dashboard", as: :dashboard
  get "user_profile/:id", to: "user_profiles#show", as: :user_profile
  get "test", to: "pages#test"
end
