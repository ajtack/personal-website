# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	LocalePrefix = /^\/([a-zA-Z]{2})(?=\/|$)/
	
	def locale_independent_path
		request.path.gsub(LocalePrefix, '')
	end

	def public_links(path = nil)
		link_labels = {
				publications_path => t(:Publications),
				about_path => t(:About_me)
			}
			
		if path.nil?
			link_labels
		else
			link_labels[path]
		end
	end
	
	def page_title_for(path = nil)
		titles = {
				publications_path.gsub(LocalePrefix, '') => t(:Publications),
				about_path.gsub(LocalePrefix, '') => t(:About_me),
				index_path.gsub(LocalePrefix, '') => t(:Home),
				root_path.gsub(LocalePrefix, '') => t(:Home)
			}
		
		if path.nil?
			titles
		else
			titles[path.gsub(LocalePrefix, '')]
		end
	end
end
