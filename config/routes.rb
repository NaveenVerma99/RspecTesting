Rails.application.routes.draw do
  
  resources :posts do
    resources :comments
  end
  resources :users, only: %i[index show edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
