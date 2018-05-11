Rails.application.routes.draw do
  resources :visitors
  resources :members do
    member do
      patch :attendance
    end
  end
  resources :churches

  devise_for :users

  get 'home/index'

  get 'analytics/:id', to: 'churches#stats', as: 'church_stats'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
