CashEnvelope::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'high_voltage/pages#show', id: 'home'
  resources :users, only: [:show, :update]
  resources :envelopes
  resources :transactions
end
