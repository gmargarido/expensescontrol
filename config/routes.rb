Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :expenses, only: [:new, :create, :show]
  resources :expense_reports, only: [:new, :create, :show]
end
