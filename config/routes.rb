Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy'
  
  resources :sessions, only: [:create, :destroy]
  
  shallow do
    resources :users do
      resources :budgets do
        resources :expenses
        resources :incomes
      end
    end
  end
  
  root 'welcome#index'
end
