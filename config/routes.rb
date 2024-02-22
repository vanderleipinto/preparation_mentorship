Rails.application.routes.draw do
  resources :assemblies
  resources :parts
  resources :accounts
  resources :suppliers
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get'/authors/:id/report', to: 'authors#report', as: 'authors_report'
  get'/suppliers/:id/report', to: 'suppliers#report', as: 'suppliers_report'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "books#index"
end
