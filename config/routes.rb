Rails.application.routes.draw do
  get 'incomes/index'
  get 'welcome/index'
  
  get 'expenses/new'
  post 'expenses/create'
  get 'expenses/edit'
  post 'expenses/update'
  get 'expenses/destroy'
  get 'expenses/show'
  get 'expenses/list'
  get 'expenses/show_reocurring'
  get 'expenses/show_stable'
  
  resources :accounts
  resources :budgets
  resources :expenses
  
  root 'welcome#index'
end
