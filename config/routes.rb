Rails.application.routes.draw do
  # Generated model routes for each Employees, Stores and Assignments
  resources :employees
  resources :assignments
  resources :stores
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Set the root url
  root to: 'static#home', as: :home
  
  get "/static/aboutus" => "static#showa"
  get "/static/contactus" => "static#showc"
  get "/static/privacy" => "static#showp"
  
  get 'sessions/new', to: 'sessions#new', as: :login
  get 'sessions/destroy', to: 'sessions#destroy', as: :logout
  
end
