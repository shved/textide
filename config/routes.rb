Rails.application.routes.draw do
  root to: 'tides#index'

  resources :tides, except: [:destroy, :edit, :show]
end
