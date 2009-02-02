ActionController::Routing::Routes.draw do |map|
  map.resources :publications, :only => [:index]
	map.index 'index', :controller => 'index'
	map.root :index
end
