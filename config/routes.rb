Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :expense_reports, only: [:new, :create, :show] do
    resources :expenses, only: [:new, :create, :show]
  end
  resources :expense_types, only: [:new, :create, :show]
  resources :expense_subtypes, only: [:new, :create, :show]
end
