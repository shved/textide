Rails.application.routes.draw do
  root to: 'textides#index'

  resources :textides, except: [:destroy, :edit, :show]
end
