CashEnvelope::Application.routes.draw do
  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
  resources :users, only: [:show, :update]
  resources :envelopes
  resources :transactions
  resources :expenses
end
