CashEnvelope::Application.routes.draw do
  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
  resources :users, only: [:show, :update]
  resources :envelopes
  resources :transactions
  resources :expenses
  put "envelopes/refresh/:id" => "envelopes#refresh", as: "refresh_envelope"
  put "envelopes/refresh_all" => "envelopes#refresh_all", as: "refresh_all_envelopes"
end
