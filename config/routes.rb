Rails.application.routes.draw do
  resources :tag_tasks
  resources :tags
  resources :tasks
  resources :users
  post 'api/login', to: 'authentication#login'
  get 'api/user_data', to: 'authentication#get_user_data'
  get 'api/json_test', to: 'authentication#json_test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
