Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'dashboard/index'
  get 'tasks/:id/cancel', to: 'tasks#cancel', as: 'cancel_task'
  get 'tasks/:id/done', to: 'tasks#done', as: 'done_task'

  resources :tasks, only: %i[show new create update]
  resources :user_teams, only: %i[create]
  resources :teams, only: %i[new create]
  devise_for :users
end
