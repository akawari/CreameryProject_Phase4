Rails.application.routes.draw do
  # Generated model routes for each Employees, Stores and Assignments
  resources :employees
  resources :assignments
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Set the root url
  root to: 'stores#index', as: :home
  
  get 'active' => 'stores#active', as: :active_stores
  get 'inactive' => 'stores#inactive', as: :inactive_stores
  
  get 'active' => 'employees#active', as: :active_employees
  get 'inactive' => 'employees#inactive', as: :inactive_employees
  
end
