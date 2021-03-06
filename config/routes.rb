Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :groups, only: %i[index create show update destroy] do
    resources :lists, except: %i[show] do
      resources :quests, except: %i[index]
      patch 'quests/:id/payment' => 'quests#payment', as: 'quest_payment'
    end
  end

  resources :users, only: %i[edit update]
  resources :calendars, only: %i[index]
  resources :records, only: %i[index]
  get 'records/contractor' => 'records#contractor', as: 'records_contractor'
  get 'records/client' => 'records#client', as: 'records_client'
  post 'groups/:id/confirm' => 'groups#confirm'
  get 'groups/:id/destroy_confirm' => 'groups#destroy_confirm', as: 'group_destroy_confirm'
  get 'groups/:id/withdrawal_confirm' => 'groups#withdrawal_confirm', as: 'group_withdrawal_confirm'
  delete 'groups/:id/withdrawal' => 'groups#withdrawal', as: 'group_withdrawal'
end
