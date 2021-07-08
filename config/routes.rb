Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :groups, only: %i[index create show update destroy] do
   resources :lists, except: %i[show] do
   resources :quests, except: %i[index]
   post 'quests/:id/contract' => 'quests#contract', as: 'quests_contract'
   end
  end

  resources :users, only: %i[edit update]
  resources :records, only: %i[index]
  post 'groups/:id/confirm' => 'groups#confirm'
  get 'groups/:id/destroy_confirm' => 'groups#destroy_confirm', as: 'group_destroy_confirm'
  get 'groups/:id/withdrawal_confirm' => 'groups#withdrawal_confirm', as: 'group_withdrawal_confirm'
  delete 'groups/:id/withdrawal' => 'groups#withdrawal', as: 'group_withdrawal'
  # resources :calendars, only: [:index]

end
