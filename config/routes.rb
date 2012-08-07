Allkiller::Application.routes.draw do
 resources :alquilers
 get :get_availables, :to => 'alquilers#get_availables'
 get :search, :to => 'alquilers#search'

 root :to => 'alquilers#index' 
end
