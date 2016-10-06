Rails.application.routes.draw do
  resources :tutor_profiles
  devise_for :users
  root 'pages#home'
  get '/tutors', to: 'pages#tutors'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
