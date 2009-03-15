ActionController::Routing::Routes.draw do |map|
	map.filter 'locale'
	map.about 'about', :controller => 'about'
	map.resource :cv, :only => [:show]
	map.index 'index', :controller => 'index'
	map.resources :publications, :only => [:index]
	map.root :index
end
