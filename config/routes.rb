CashEnvelope::Application.routes.draw do
  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
  resources :users, only: [:show, :update]
  resources :envelopes
  resources :transactions
  resources :expenses
  resources :unusual_expenses
  get "envelope/refresh/:id" => "envelopes#refresh", as: "refresh_envelope"
  get "envelope/refresh_all" => "envelopes#refresh_all", as: "refresh_all_envelopes"
end
