Rails.application.routes.draw do

  resources :student_profiles
  resources :tutor_profiles do
  end
  devise_for :users

  root 'pages#home'
  get '/tutors', to: 'pages#tutors'
  post '/tutors', to: 'pages#search'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
