# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
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
	
	def page_titles(path = nil)
		titles = {
				publications_path => t(:Publications),
				about_path => t(:About_me),
				index_path => t(:Home),
				root_path => t(:Home)
			}
		
		if path.nil?
			titles
		else
			titles[path]
		end
	end
end
