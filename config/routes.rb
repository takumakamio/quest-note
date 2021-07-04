Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :lists ,except: [:index]
  resources :users, only: %i[edit update]

  resources :quests
  resources :records, only: %i[index]
  # resources :calendars, only: [:index]
  resources :groups, only: %i[index create show update destroy]
  post 'groups/:id/confirm' => 'groups#confirm'
  get 'groups/:id/destroy_confirm' => 'groups#destroy_confirm', as: 'group_destroy_confirm'
  get 'groups/:id/withdrawal_confirm' => 'groups#withdrawal_confirm', as: 'group_withdrawal_confirm'
  delete 'groups/:id/withdrawal' => 'groups#withdrawal', as: 'group_withdrawal'

end
