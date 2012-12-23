CashEnvelope::Application.routes.draw do
  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
  resource :users, only: [:show, :update]
end
