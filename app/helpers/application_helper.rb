# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def public_links
		{
			publications_path => 'Publications',
			about_path => 'About Me'
		}
	end
	
	def page_titles
		{
			publications_path => 'Publications',
			about_path => 'About Me',
			root_path => 'Home'
		}
	end
end
