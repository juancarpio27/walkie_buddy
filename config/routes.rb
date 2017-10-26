Rails.application.routes.draw do
  get 'trips/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root 'menu#index', as: :authenticated_root
  end

  root 'home#welcome'

  get "faq" => "home#faq"
  get "services" => "home#services"
  get "about" => "home#about"
  get "join" => "home#join"
  get "contact" => 'menu#contact'

  resources :users, only: [:edit, :update] do
    member do
      get 'edit_password'
    end
    resource :card, only: [:edit, :update, :new, :create, :destroy]
    resources :pets
    resources :trips
  end



end
