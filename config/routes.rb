Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # API routes
  namespace :api do
    devise_for :users, path: 'auth', controllers: {
      sessions: 'api/auth/sessions',
      registrations: 'api/auth/registrations'
    }
    
    resources :products, only: [:index, :show]
    resources :categories, only: [:index]
    resources :cart_items, only: [:index, :create, :update, :destroy]
  end
end