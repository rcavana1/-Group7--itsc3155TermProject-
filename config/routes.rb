Rails.application.routes.draw do
  get 'incomes/index'
  get 'welcome/index'
  
  resources :accounts
  resources :budgets
  
  root 'welcome#index'
end
