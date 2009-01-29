ActionController::Routing::Routes.draw do |map|
  map.resources :publications

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
	map.root :controller => 'index'
end
