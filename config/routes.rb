Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :desks, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]
  patch "/bookings/:id/accepted", to: "bookings#accept", as: :booking_accept
  patch "/bookings/:id/declined", to: "bookings#decline", as: :booking_decline
  resources :ownerlistings, only: [:index, :show]
end
