Rails.application.routes.draw do
  root 'reports#index', as: 'home'

  get  'create_report' => 'pages#create_report', as: 'crt'
  get 'add_mark' => 'pages#add_mark', as: 'add_mark'
  post 'update' => 'pages#update', as: 'pages_update'
  get 'destroy' => 'reports#destroy', as: 'delete'
  resources :reports 
end
