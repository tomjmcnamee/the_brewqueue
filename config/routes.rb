Rails.application.routes.draw do
  resources :breweries 
  #resources :user_brew_queues
  resources :comments 
  resources :visits

  # UserBrewQueues Routes
  post "/user_brew_queues", to: "user_brew_queues#create"
  delete "/user_brew_queues", to: "user_brew_queues#destroy"


  # User Routes
  
  get "/users/", to: "users#index", as: "users"
  get "/signup", to: "users#new", as: "signup"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"

  post "/users", to: "users#create"

  patch "/users/:id", to: "users#update"

  delete "/users/:id", to: "users#destroy"

  # Session Routes 
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  # Application Routes
  get "/", to: "application#homepage", as: "homepage"

end

