Rails.application.routes.draw do

  resources :tutor_profiles do
  end
  devise_for :users

  root 'pages#home'
  get '/tutors', to: 'pages#tutors'
  post '/tutors', to: 'pages#search'
  post '/tutors/filter', to: 'pages#filter'
  get '/tutors/filter', to: 'pages#tutors'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
