Allkiller::Application.routes.draw do
 resources :alquilers

 root :to => 'alquilers#index' 
end
