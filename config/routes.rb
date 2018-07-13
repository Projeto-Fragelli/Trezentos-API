Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/user/all', to: 'users#all', :defaults => { :format => :json }
  get '/user/:id', to: 'users#show', :defaults => { :format => :json }
  post '/user/create', to: 'users#create', :defaults => { :format => :json }
  put '/user/update/:id', to: 'users#update', :defaults => { :format => :json }
  delete '/user/delete/:id', to: 'users#destroy', :defaults => { :format => :json }

end
