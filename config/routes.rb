ActionController::Routing::Routes.draw do |map|
  map.resources :publications, :only => [:index]
	map.about 'about', :controller => 'about'
	map.index 'index', :controller => 'index'
	map.root :index
end
