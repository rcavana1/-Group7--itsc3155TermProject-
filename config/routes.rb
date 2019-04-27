Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy'
  
  resources :sessions, only: [:create, :destroy]
  
  resources :posts
  # get 'incomes/index'
  # get 'welcome/index'
  
  # get 'accounts/new'
  # post 'accounts/create'
  # get 'accounts/edit'
  # post 'accounts/update'
  # get 'accounts/destroy'
  # get 'accounts/show'
  # get 'accounts/login'
  
  # get 'expenses/new'
  # post 'expenses/create'
  # get 'expenses/edit'
  # post 'expenses/update'
  # get 'expenses/destroy'
  # get 'expenses/show'

  
  # get 'incomes/new'
  # post 'incomes/create'
  # get 'incomes/edit'
  # post 'incomes/update'
  # get 'incomes/destroy'
  # get 'incomes/show'
  
  resources :accounts
  resources :budgets do
    resources :expenses
    resources :incomes
  end
  
  
  root 'welcome#index'
end
