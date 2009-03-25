# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	include AuthenticatedSystem
	
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => 'efb3382558c540a1077236e6c50aed26'
  before_filter :choose_locale

	def choose_locale
		I18n.locale = params[:locale] || request.compatible_language_from(I18n.available_locales)
	end
end
