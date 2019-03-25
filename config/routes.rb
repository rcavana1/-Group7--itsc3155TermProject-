Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :budgets
  
  root 'welcome#index'
end
