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
  
  get 'incomes/new'
  post 'incomes/create'
  get 'incomes/edit'
  post 'incomes/update'
  get 'incomes/destroy'
  get 'incomes/show'
  get 'incomes/list'
  get 'incomes/show_reocurring'
  get 'incomes/show_stable'
  
  resources :accounts
  # resources :accounts do
  #   resources :budgets do
  #     resources :incomes
  #     resources :expenses
  # end
  resources :budgets
  resources :expenses
  resources :incomes
  
  root 'welcome#index'
end
