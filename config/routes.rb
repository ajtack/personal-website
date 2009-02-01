ActionController::Routing::Routes.draw do |map|
  map.resources :publications, :only => [:index]

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
	map.root :controller => 'index'
end
