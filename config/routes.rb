Rails.application.routes.draw do
  resources :tutor_profiles do
    collection do
      get :search
      post :filter
    end
  end

  devise_for :users
  root 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
