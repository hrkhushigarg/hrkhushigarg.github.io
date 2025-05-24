Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  get 'sitemap', to: 'pages#sitemap', defaults: {format: 'xml'}
  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

resources :works, only: [:index, :show] do
  resources :reviews, only: [:new, :create]
end
end
