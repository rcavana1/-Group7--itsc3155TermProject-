Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :accounts
  resources :budgets
  
  root 'welcome#index'
end
