# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	LocalePrefix = /^\/([a-zA-Z]{2})(?=\/|$)/
	
	def locale_independentize(path = request.path)
		path.gsub(LocalePrefix, '')
	end

	def public_links
		link_labels = {
				locale_independentize(publications_path) => {:title => t(:Publications), :path => publications_path},
				locale_independentize(about_path) => {:title => t(:About_me), :path => about_path}
			}
			
		link_labels
	end
	
	def page_title_for(path = nil)
		titles = {
				locale_independentize(publications_path) => t(:Publications),
				locale_independentize(about_path) => t(:About_me),
				locale_independentize(index_path) => t(:Home),
				locale_independentize(root_path) => t(:Home)
			}
			
		titles[locale_independentize(path)]
	end
end
