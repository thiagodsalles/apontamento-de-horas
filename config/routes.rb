Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :tasks, except: %i[index destroy edit] do
    member do
      get :cancel
      get :done
    end
  end

  resources :user_teams, only: %i[create]
  resources :teams, only: %i[new create]
  devise_for :users
end
