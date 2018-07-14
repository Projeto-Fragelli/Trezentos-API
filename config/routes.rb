Rails.application.routes.draw do
  resources :grades
  resources :grade_types
  resources :user_has_groups
  resources :groups
  resources :user_has_exams
  resources :exams
  resources :user_has_classrooms
  resources :classrooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/login', to: 'users#login'
  post '/register', to: 'users#register', :defaults => { :format => :json }

  get '/user/all' => 'users#all', :as => 'user', :defaults => { :format => :json }
  get '/user/:id', to: 'users#show', :defaults => { :format => :json }
  put '/user/update/:id', to: 'users#update', :defaults => { :format => :json }
  delete '/user/delete/:id', to: 'users#destroy', :defaults => { :format => :json }

end
