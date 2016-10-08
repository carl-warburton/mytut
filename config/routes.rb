Rails.application.routes.draw do
  resources :tutor_profiles do
    collection do
      post :filter
    end
  end

  devise_for :users
  root 'pages#home'

  get '/tutors', to: 'tutor_profiles#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
