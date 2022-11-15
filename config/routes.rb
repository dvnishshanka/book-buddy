Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books
  resources :book_copies, only: [:new, :create, :index, :show]

  get "dashboard/:id", to: "pages#dashboard", as: :dashboard

end
