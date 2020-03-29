Rails.application.routes.draw do
  root 'login#new'
  get 'signup' => 'signup#new'
  post 'signup' => 'signup#create'

  get 'login' => 'login#new'
  post 'login' => 'login#create'
  delete 'logout' => 'login#destroy'

  get 'tasks' => 'tasks#index'
  post 'tasks/new' => 'tasks#create', as: 'new_task'
  post 'tasks/update' => 'tasks#batch_update', as: 'update_tasks'
  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  patch 'tasks/:id/edit' => 'tasks#update', as: false
  delete 'tasks/:id' => 'tasks#destroy', as: 'remove_task'
end
