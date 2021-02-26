Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  # Keep /dogs path for all dogs (not owner-specific)
  resources :dogs, only: [:index]

  resources :users do
    resources :dogs, shallow: true
  end
  root to: "dogs#index"
end
