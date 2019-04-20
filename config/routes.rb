Rails.application.routes.draw do
  get 'incomes/index'
  get 'welcome/index'
  
  get 'accounts/new'
  post 'accounts/create'
  get 'accounts/edit'
  post 'accounts/update'
  get 'accounts/destroy'
  get 'accounts/show'
  get 'accounts/login'
  
  get 'expenses/new'
  post 'expenses/create'
  get 'expenses/edit'
  post 'expenses/update'
  get 'expenses/destroy'
  get 'expenses/show'

  
  get 'incomes/new'
  post 'incomes/create'
  get 'incomes/edit'
  post 'incomes/update'
  get 'incomes/destroy'
  get 'incomes/show'
  
  resources :accounts
  resources :budgets
  resources :expenses
  resources :incomes
  
  root 'welcome#index'
end
