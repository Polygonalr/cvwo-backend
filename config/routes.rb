Rails.application.routes.draw do
  resources :users
  post 'api/login', to: 'authentication#login'
  get 'api/user_data', to: 'authentication#get_user_data'
  get 'api/json_test', to: 'authentication#json_test'

  get 'api/get_tasks', to: 'tasks_api#get_tasks'
  post 'api/add_task', to: 'tasks_api#add_task'
  post 'api/update_task', to: 'tasks_api#update_task'
  post 'api/delete_task', to: 'tasks_api#delete_task'

  get 'api/get_tags', to: 'tasks_api#get_tags'
  post 'api/add_tag', to: 'tasks_api#add_tag'
  post 'api/remove_tag', to: 'tasks_api#remove_tag'
  post 'api/assign_tag', to: 'tasks_api#assign_tag'
  post 'api/unassign_tag', to: 'tasks_api#unassign_tag'

  post 'api/add_user', to: 'users#create'

  get 'api/get_colors', to: 'tasks_api#get_colors'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
