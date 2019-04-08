Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :accounts
  resources :budgets
  resources :expenses
  
  root 'welcome#index'
end
