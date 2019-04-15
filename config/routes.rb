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
  get 'incomes/show_reocurring'
  get 'incomes/show_stable'
  
  # resources :accounts
  resources :accounts do
    resources :budgets
  end
  #     resources :incomes
  #     resources :expenses
  # end
  resources :budgets
  resources :expenses
  resources :incomes
  
  root 'welcome#index'
end
