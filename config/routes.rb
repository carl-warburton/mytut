Rails.application.routes.draw do

  resources :tutor_bookings
  resources :student_profiles
  resources :tutor_profiles

  devise_for :users

  root 'pages#home'
  get '/tutors', to: 'pages#tutors'
  post '/tutors', to: 'pages#search'
  get '/bookings', to: 'pages#bookings'
  post '/bookings', to: 'pages#approval'

  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
