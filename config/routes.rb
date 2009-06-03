ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.resources :users
  map.resource :session

	map.filter 'locale'
	map.about 'about', :controller => 'about'
	map.resource :cv, :only => [:show]
	map.index 'index', :controller => 'index'
	map.resources :publications, :only => [:index]
	map.root :index
end
