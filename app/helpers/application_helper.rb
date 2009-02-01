# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def public_links
		{
			publications_path => 'Publications'
		}
	end
end
